package AuthApp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Home controller for root URL redirection.
 */
@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        System.out.println("Home endpoint called - redirecting to /students/list");
        return "redirect:/students/list";
    }

    // Backward compatibility - redirect old URL to new structure
    @GetMapping("/addStudent")
    public String oldAddStudent() {
        System.out.println("Old addStudent endpoint called - redirecting to /students/add");
        return "redirect:/students/add";
    }

    // Health check endpoint for deployment verification
    @GetMapping("/health")
    @ResponseBody
    public String health() {
        return "OK - Student Management System is running!";
    }
}
