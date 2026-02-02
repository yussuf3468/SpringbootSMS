package AuthApp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Home controller for root URL redirection.
 */
@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "redirect:/students/list";
    }

    // Backward compatibility - redirect old URL to new structure
    @GetMapping("/addStudent")
    public String oldAddStudent() {
        return "redirect:/students/add";
    }
}
