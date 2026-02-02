package AuthApp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

/**
 * Initialize database with sample data for testing.
 */
@Component
public class DataInitializer implements CommandLineRunner {

    @Autowired
    private StudentRepository studentRepository;

    @Override
    public void run(String... args) throws Exception {
        // Check if database is empty
        if (studentRepository.count() == 0) {
            // Add sample students for testing
            Student student1 = new Student();
            student1.setName("John Doe");
            student1.setAge(22);
            student1.setEmail("john.doe@university.edu");
            student1.setCourse("Computer Science");
            student1.setPhoneNumber("+1234567890");
            studentRepository.save(student1);

            Student student2 = new Student();
            student2.setName("Jane Smith");
            student2.setAge(20);
            student2.setEmail("jane.smith@university.edu");
            student2.setCourse("Data Science");
            student2.setPhoneNumber("+1234567891");
            studentRepository.save(student2);

            Student student3 = new Student();
            student3.setName("Bob Wilson");
            student3.setAge(25);
            student3.setEmail("bob.wilson@university.edu");
            student3.setCourse("Software Engineering");
            student3.setPhoneNumber("+1234567892");
            studentRepository.save(student3);

            System.out.println("✅ Sample data initialized: 3 students added to database");
        } else {
            System.out.println("ℹ️ Database already contains " + studentRepository.count() + " students");
        }
    }
}
