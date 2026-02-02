package AuthApp;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository interface for Student entity.
 * Provides CRUD operations and custom queries.
 */
@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    
    // Find students by name (case-insensitive, partial match)
    List<Student> findByNameContainingIgnoreCase(String name);
    
    // Find students by course
    List<Student> findByCourse(String course);
    
    // Find student by email
    Student findByEmail(String email);
    
    // Check if email already exists
    boolean existsByEmail(String email);
}
