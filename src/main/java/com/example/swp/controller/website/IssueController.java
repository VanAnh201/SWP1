package com.example.swp.controller.website;

import com.example.swp.dto.IssueRequest;
import com.example.swp.entity.Issue;
import com.example.swp.entity.Staff;
import com.example.swp.repository.CustomerRepository;
import com.example.swp.repository.StaffRepository;
import com.example.swp.service.IssueService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.ArrayList;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/SWP/issues")
public class IssueController {

    @Autowired
    private IssueService issueService;

    @Autowired
    private CustomerRepository customerRepository;

    @Autowired
    private StaffRepository staffRepository;

    // Hiển thị form tạo mới
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("issueRequest", new IssueRequest());
        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("staffs", staffRepository.findAll());
        return "create-issue";
    }

    // Nhận form submit
    @PostMapping("/create")
    public String createIssue(@ModelAttribute IssueRequest issueRequest, Model model) {
        try {
            issueService.createIssue(issueRequest);
            model.addAttribute("success", "Tạo Issue thành công!");
            model.addAttribute("issueRequest", new IssueRequest()); // reset form
        } catch (Exception e) {
            model.addAttribute("error", "Tạo Issue thất bại: " + e.getMessage());
        }
        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("staffs", staffRepository.findAll());
        return "create-issue";
    }

    @GetMapping("/report")
    public String showStaffReport(Model model) {
        List<Issue> issues = issueService.getAllIssues();
        if (issues == null) {
            issues = new ArrayList<>();
        }
        // Chỉ hiển thị issues được tạo bởi khách hàng
        issues = issues.stream()
                .filter(issue -> "CUSTOMER".equals(issue.getCreatedByType()))
                .collect(Collectors.toList());
        model.addAttribute("issues", issues);
        return "staff-report";
    }

    @GetMapping("/staff-send-report")
    public String showSendReportForm(Model model) {
        List<Issue> issues = issueService.getAllIssues();
        model.addAttribute("issues", issues);
        model.addAttribute("customers", customerRepository.findAll());
        model.addAttribute("staffs", staffRepository.findAll());
        return "staff-send-report";
    }

    @PostMapping("/staff-send-report")
    public String sendReport(
            @RequestParam(required = false) List<Long> issueIds,
            @RequestParam(required = false) String customReport,
            @RequestParam(required = false) Integer customerId,
            @RequestParam(required = false) Integer assignedStaffId,
            Model model
    ) {
        try {
            if (customReport != null && !customReport.trim().isEmpty() && assignedStaffId != null) {
                IssueRequest issueRequest = new IssueRequest();
                issueRequest.setSubject("Báo cáo từ nhân viên");
                issueRequest.setDescription(customReport);
                issueRequest.setCustomerId(customerId); // có thể null cho vấn đề nội bộ
                issueRequest.setAssignedStaffId(assignedStaffId);

                Issue issue = issueService.createIssue(issueRequest);
                issue.setCreatedByType("STAFF");
                issueService.save(issue);
            }

            model.addAttribute("success", "Gửi báo cáo thành công!");
            model.addAttribute("issues", issueService.getAllIssues());
            model.addAttribute("customReport", "");
            model.addAttribute("customers", customerRepository.findAll());
            model.addAttribute("staffs", staffRepository.findAll());

            return "staff-send-report";
        } catch (Exception e) {
            model.addAttribute("error", "Gửi báo cáo thất bại: " + e.getMessage());
            model.addAttribute("issues", issueService.getAllIssues());
            model.addAttribute("customers", customerRepository.findAll());
            model.addAttribute("staffs", staffRepository.findAll());
            return "staff-send-report";
        }
    }

    @GetMapping("/{id}/detail")
    public String issueDetail(@PathVariable("id") int id, Model model) {
        Issue issue = issueService.getIssueById(id).orElseThrow(() -> new RuntimeException("Không tìm thấy issue!"));
        List<Staff> staffs = staffRepository.findAll();
        model.addAttribute("issue", issue);
        model.addAttribute("staffs", staffs);
        return "staff-report-detail";
    }

    @PostMapping("/{id}/detail")
    public String updateIssueDetail(
            @PathVariable("id") int id,
            @RequestParam("assignedStaffId") int assignedStaffId,
            @RequestParam("resolved") Boolean resolved,
            Model model) {
        issueService.updateAssignedStaffAndStatus(id, assignedStaffId, resolved);

        Issue issue = issueService.getIssueById(id).orElseThrow(() -> new RuntimeException("Không tìm thấy issue!"));
        List<Staff> staffs = staffRepository.findAll();
        model.addAttribute("issue", issue);
        model.addAttribute("staffs", staffs);
        model.addAttribute("success", "Cập nhật thành công!");
        return "staff-report-detail";
    }



}
