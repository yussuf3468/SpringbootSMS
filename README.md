# 🎓 Student Management System

A complete web-based Student Management System built with Spring Boot, featuring full CRUD operations, database persistence, and a modern UI.

## ✨ Features

- **Complete CRUD Operations**: Create, Read, Update, Delete students
- **Database Integration**: H2 in-memory database with JPA/Hibernate
- **Search Functionality**: Find students by name
- **Validation**: Server-side validation for all inputs
- **Modern UI**: Beautiful purple-gradient responsive design
- **Sample Data**: Auto-loads 3 sample students on startup
- **RESTful Architecture**: Clean URL structure

## 📦 Technologies Used

- **Spring Boot 4.0.2** - Backend framework
- **Spring Data JPA** - Database operations
- **H2 Database** - In-memory database
- **JSP + JSTL** - View layer
- **Jakarta Validation** - Form validation
- **Maven** - Build tool
- **Embedded Tomcat** - Web server

## 🚀 Quick Start

### Prerequisites
- Java 17 or higher
- Maven (included via wrapper)

### Running the Application

**Option 1: Using the start script (Windows)**
```bash
start.bat
```

**Option 2: Using Maven**
```bash
./mvnw clean spring-boot:run
```

**Option 3: Manual commands**
```bash
./mvnw clean package -DskipTests
./mvnw spring-boot:run
```

### Access the Application

Once started, open your browser to:
```
http://localhost:8080
```

## 📍 Available URLs

| URL | Description |
|-----|-------------|
| `/` | Home (redirects to student list) |
| `/students/list` | View all students |
| `/students/add` | Add new student |
| `/students/edit/{id}` | Edit existing student |
| `/students/view/{id}` | View student details |
| `/students/delete/{id}` | Delete student |
| `/h2-console` | Database console |

## 🗄️ Database Access

Access H2 Console at: `http://localhost:8080/h2-console`

**Connection Details:**
- JDBC URL: `jdbc:h2:mem:studentdb`
- Username: `sa`
- Password: _(leave empty)_

## 📊 Student Model

Each student has the following fields:

- **ID** - Auto-generated (Long)
- **Name** - Required, 2-100 characters
- **Age** - Required, 1-60
- **Email** - Required, unique, valid format
- **Course** - Required, 2-100 characters
- **Phone Number** - Optional, max 15 characters
- **Created At** - Auto-timestamp
- **Updated At** - Auto-timestamp

## 🎨 Features Overview

### List Students
- Displays all students in a table
- Search by name functionality
- Statistics dashboard
- Quick action buttons (View, Edit, Delete)

### Add/Edit Student
- Clean form with validation
- Real-time error messages
- Field hints for users
- Responsive two-column layout

### View Student Details
- Profile card with all information
- Creation and update timestamps
- Quick access to edit/delete

## 📁 Project Structure

```
AuthApp/
├── src/main/java/AuthApp/
│   ├── AuthAppApplication.java      # Main application
│   ├── Student.java                 # Entity model
│   ├── StudentRepository.java       # Data access
│   ├── StudentService.java          # Business logic
│   ├── StudentController.java       # Web controller
│   ├── HomeController.java          # Root routing
│   └── DataInitializer.java         # Sample data loader
├── src/main/webapp/WEB-INF/jsp/
│   ├── listStudents.jsp             # Student list view
│   ├── studentForm.jsp              # Add/Edit form
│   └── viewStudent.jsp              # Student details
├── src/main/resources/
│   └── application.properties       # Configuration
├── pom.xml                          # Maven dependencies
└── start.bat                        # Quick start script
```

## 🧪 Testing the Application

### Sample Data
The application automatically loads 3 sample students on startup:
1. John Doe - Computer Science
2. Jane Smith - Data Science
3. Bob Wilson - Software Engineering

### Test Workflow
1. **List**: View all students at `/students/list`
2. **Search**: Try searching for "John"
3. **View**: Click "View" on any student
4. **Edit**: Modify a student's information
5. **Add**: Create a new student
6. **Delete**: Remove a student

## 🔧 Configuration

### Change Port
Edit `src/main/resources/application.properties`:
```properties
server.port=8081
```

### Database Configuration
```properties
spring.datasource.url=jdbc:h2:mem:studentdb
spring.h2.console.enabled=true
spring.jpa.hibernate.ddl-auto=update
```

### JSP View Resolver
```properties
spring.mvc.view.prefix=/WEB-INF/jsp/
spring.mvc.view.suffix=.jsp
```

## 🐛 Troubleshooting

### Port Already in Use
```bash
netstat -ano | findstr :8080
taskkill /PID <PID> /F
```

### Build Issues
```bash
./mvnw clean install -DskipTests -U
```

### JSP Not Rendering
Ensure JSP files are in: `src/main/webapp/WEB-INF/jsp/`

## 📚 API Endpoints

### GET Endpoints
- `GET /` - Redirect to student list
- `GET /students/list` - Show all students
- `GET /students/list?search={name}` - Search students
- `GET /students/add` - Show add form
- `GET /students/edit/{id}` - Show edit form
- `GET /students/view/{id}` - Show student details
- `GET /students/delete/{id}` - Delete student

### POST Endpoints
- `POST /students/add` - Create new student
- `POST /students/edit/{id}` - Update student

## 🎯 Learning Outcomes

This project demonstrates:
- Spring Boot MVC architecture
- JPA/Hibernate ORM
- CRUD operations
- Form validation
- Database integration
- RESTful design
- JSP templating
- Responsive UI design

## 📄 License

This project is open source and available for educational purposes.

## 👨‍💻 Author

Built with Spring Boot 4.0.2

## 🙏 Acknowledgments

- Spring Boot team for the excellent framework
- H2 Database for embedded database support
- Jakarta EE for validation standards

---

**Happy Coding!** 🚀

For detailed guides, check:
- `QUICKSTART.md` - Quick start guide
- `start.bat` - Windows startup script
