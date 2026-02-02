package AuthApp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

/**
 * Controller for Student Management System.
 * Handles all CRUD operations.
 */
@Controller
@RequestMapping("/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * Home page - redirect to list
     */
    @GetMapping("/")
    public String home() {
        return "redirect:/students/list";
    }

    /**
     * List all students
     */
    @GetMapping("/list")
    public String listStudents(@RequestParam(required = false) String search, Model model) {
        List<Student> students;
        
        if (search != null && !search.isEmpty()) {
            students = studentService.searchStudentsByName(search);
            model.addAttribute("search", search);
        } else {
            students = studentService.getAllStudents();
        }
        
        model.addAttribute("students", students);
        model.addAttribute("totalCount", studentService.getStudentCount());
        return "listStudents";
    }

    /**
     * Show form to add new student
     */
    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("student", new Student());
        model.addAttribute("action", "add");
        return "studentForm";
    }

    /**
     * Process add student form
     */
    @PostMapping("/add")
    public String addStudent(@Validated @ModelAttribute("student") Student student,
                            BindingResult bindingResult,
                            RedirectAttributes redirectAttributes,
                            Model model) {
        
        // Check if email already exists
        if (studentService.emailExists(student.getEmail())) {
            bindingResult.rejectValue("email", "error.student", "Email already exists");
        }
        
        if (bindingResult.hasErrors()) {
            model.addAttribute("action", "add");
            return "studentForm";
        }

        studentService.saveStudent(student);
        redirectAttributes.addFlashAttribute("successMessage", "Student added successfully!");
        return "redirect:/students/list";
    }

    /**
     * Show form to edit existing student
     */
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Optional<Student> student = studentService.getStudentById(id);
        
        if (student.isPresent()) {
            model.addAttribute("student", student.get());
            model.addAttribute("action", "edit");
            return "studentForm";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Student not found!");
            return "redirect:/students/list";
        }
    }

    /**
     * Process edit student form
     */
    @PostMapping("/edit/{id}")
    public String updateStudent(@PathVariable Long id,
                               @Validated @ModelAttribute("student") Student student,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes,
                               Model model) {
        
        if (bindingResult.hasErrors()) {
            model.addAttribute("action", "edit");
            return "studentForm";
        }

        Student updated = studentService.updateStudent(id, student);
        
        if (updated != null) {
            redirectAttributes.addFlashAttribute("successMessage", "Student updated successfully!");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to update student!");
        }
        
        return "redirect:/students/list";
    }

    /**
     * View student details
     */
    @GetMapping("/view/{id}")
    public String viewStudent(@PathVariable Long id, Model model, RedirectAttributes redirectAttributes) {
        Optional<Student> student = studentService.getStudentById(id);
        
        if (student.isPresent()) {
            model.addAttribute("student", student.get());
            return "viewStudent";
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Student not found!");
            return "redirect:/students/list";
        }
    }

    /**
     * Delete student
     */
    @GetMapping("/delete/{id}")
    public String deleteStudent(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            studentService.deleteStudent(id);
            redirectAttributes.addFlashAttribute("successMessage", "Student deleted successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to delete student!");
        }
        return "redirect:/students/list";
    }

    /**
     * Search students by course
     */
    @GetMapping("/course/{course}")
    public String getStudentsByCourse(@PathVariable String course, Model model) {
        List<Student> students = studentService.getStudentsByCourse(course);
        model.addAttribute("students", students);
        model.addAttribute("course", course);
        model.addAttribute("totalCount", students.size());
        return "listStudents";
    }
}
