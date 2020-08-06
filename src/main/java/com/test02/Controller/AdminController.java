package com.test02.Controller;

import com.test02.Dto.Pagination;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @RequestMapping("/admin")
    public String loginForm() throws Exception {

        return "admin";
    }

    @RequestMapping("/admin/login")
    public String login(HttpServletRequest request, HttpSession session) throws Exception {
        String adminId = request.getParameter("adminid");
        String adminPwd = request.getParameter("adminpwd");
        System.out.println(adminId + adminPwd);
        if (adminId.equals("modumadmin") && adminPwd.equals("1234")) {
            session.setAttribute("adminid", adminId);
            session.setAttribute("adminpwd", adminPwd);
        }
        else {
            System.out.println("끄아아악");
            return "admin";
        }

        return "redirect:/";
    }
}
