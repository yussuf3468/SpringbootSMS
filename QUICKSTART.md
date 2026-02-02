# 🚀 QUICK START GUIDE - Student Management System

## ⚠️ IMPORTANT: URL Changes

The application URLs have changed! The old `/addStudent` no longer exists.

### Old URL (DOESN'T WORK):
❌ `http://localhost:8080/addStudent`

### New URLs (USE THESE):
✅ `http://localhost:8080/` → Redirects to student list
✅ `http://localhost:8080/students/list` → Main dashboard
✅ `http://localhost:8080/students/add` → Add new student
✅ `http://localhost:8080/h2-console` → Database console

---

## 🎯 How to Run (3 Easy Methods)

### Method 1: Use the Start Script (EASIEST)
1. Double-click `start.bat` in your project folder
2. Wait for "Started AuthAppApplication" message
3. Open browser to: http://localhost:8080

### Method 2: PowerShell Commands
```powershell
cd "C:\Users\HP\OneDrive\Documents\Downloads\AuthApp\AuthApp"
.\mvnw.cmd clean package -DskipTests
.\mvnw.cmd spring-boot:run
```

### Method 3: Single Command
```powershell
cd "C:\Users\HP\OneDrive\Documents\Downloads\AuthApp\AuthApp"
.\mvnw.cmd clean spring-boot:run
```

---

## 🌐 What to Do After Starting

1. **Wait for this message in terminal:**
   ```
   Started AuthAppApplication in X.XXX seconds
   Tomcat started on port(s): 8080
   ```

2. **Open your browser**

3. **Go to:** `http://localhost:8080`

4. **You will see:** Beautiful purple-gradient student management dashboard

---

## 📍 Main Features & URLs

| What You Want | URL | What It Does |
|---------------|-----|--------------|
| **View all students** | http://localhost:8080/students/list | Shows table of all students |
| **Add new student** | http://localhost:8080/students/add | Form to add student |
| **Home page** | http://localhost:8080/ | Auto-redirects to list |
| **Database console** | http://localhost:8080/h2-console | View database directly |

---

## 🎨 What You'll See

### Student List Page
- Search bar
- Add New Student button (green)
- Table with: ID, Name, Age, Email, Course, Phone
- Action buttons for each student:
  - View (blue)
  - Edit (yellow)
  - Delete (red)

### Add Student Form
Fields:
- **Name** (required, 2-100 chars)
- **Age** (required, 1-60)
- **Email** (required, unique, valid format)
- **Course** (required)
- **Phone Number** (optional)

---

## 🔧 Troubleshooting

### Error: "Port 8080 already in use"
**Solution:**
```powershell
# Find what's using port 8080
netstat -ano | findstr :8080

# Kill it (replace XXXX with the PID from above)
taskkill /PID XXXX /F

# Or change port in application.properties:
server.port=8081
```

### Error: "Whitelabel Error Page 404"
**Reason:** You're using the old URL

**Solution:** Use the new URLs:
- ❌ OLD: http://localhost:8080/addStudent
- ✅ NEW: http://localhost:8080/students/add
- ✅ OR: http://localhost:8080/students/list

### Error: "Whitelabel Error Page 500"
**Reason:** JSP rendering issue

**Check:**
1. JSP files are in: `src/main/webapp/WEB-INF/jsp/`
2. Files exist:
   - listStudents.jsp
   - studentForm.jsp
   - viewStudent.jsp

### Build Fails
```powershell
# Clean everything and rebuild
cd "C:\Users\HP\OneDrive\Documents\Downloads\AuthApp\AuthApp"
.\mvnw.cmd clean install -DskipTests -U
```

---

## 🎓 Sample Test Workflow

### Test 1: Add a Student
1. Start app: Run `start.bat`
2. Open: http://localhost:8080
3. Click: "Add New Student" (green button)
4. Fill form:
   - Name: John Doe
   - Age: 25
   - Email: john@university.edu
   - Course: Computer Science
   - Phone: +1234567890
5. Click: "💾 Add Student"
6. Result: Redirects to list, John appears in table

### Test 2: Search
1. In search box, type: "John"
2. Click "Search"
3. Only John Doe appears
4. Clear search to see all

### Test 3: View Details
1. Find John in the list
2. Click "View" (blue button)
3. See full profile with timestamps

### Test 4: Edit
1. From detail page, click "Edit"
2. Change course to: "Data Science"
3. Click "Update"
4. Verify change in list

### Test 5: Delete
1. Find John in list
2. Click "Delete" (red button)
3. Confirm deletion
4. John removed from list

---

## 🗄️ Database Console Access

To see your data in the database:

1. Start application
2. Open: http://localhost:8080/h2-console
3. Enter:
   - JDBC URL: `jdbc:h2:mem:studentdb`
   - Username: `sa`
   - Password: (leave empty)
4. Click "Connect"
5. Run queries:
   ```sql
   SELECT * FROM students;
   SELECT COUNT(*) FROM students;
   ```

---

## 📊 System Information

**Technology Stack:**
- Spring Boot 4.0.2
- H2 Database (in-memory)
- Spring Data JPA
- JSP + JSTL
- Jakarta Validation
- Embedded Tomcat

**Project Structure:**
```
AuthApp/
├── src/main/java/AuthApp/
│   ├── AuthAppApplication.java     (Main app)
│   ├── Student.java                (Entity)
│   ├── StudentRepository.java      (Database)
│   ├── StudentService.java         (Logic)
│   ├── StudentController.java      (Web)
│   └── HomeController.java         (Routes)
├── src/main/webapp/WEB-INF/jsp/
│   ├── listStudents.jsp            (List view)
│   ├── studentForm.jsp             (Add/Edit)
│   └── viewStudent.jsp             (Details)
├── src/main/resources/
│   └── application.properties      (Config)
├── pom.xml                         (Dependencies)
└── start.bat                       (Quick start)
```

---

## ✅ Verification Checklist

Before reporting issues, verify:

- [ ] Java 17+ is installed (`java -version`)
- [ ] Port 8080 is free (`netstat -ano | findstr :8080`)
- [ ] You're in the correct directory
- [ ] You see "Started AuthAppApplication" in terminal
- [ ] You're using NEW URLs (not /addStudent)
- [ ] Browser is accessing http://localhost:8080

---

## 🎉 Expected Results

When everything works:

1. **Terminal shows:**
   ```
   Started AuthAppApplication in 5.123 seconds
   Tomcat started on port(s): 8080
   ```

2. **Browser shows:**
   - Purple gradient header: "🎓 Student Management System"
   - Search bar and "Add New Student" button
   - Table (empty initially)
   - "No Students Found" message if empty

3. **After adding students:**
   - Students appear in table
   - Can search, edit, view, delete
   - Data persists until app restart

---

## 📞 Still Having Issues?

If the application isn't working:

1. **Check terminal output** for error messages
2. **Try clean build:**
   ```powershell
   .\mvnw.cmd clean install -DskipTests
   ```
3. **Verify files exist:**
   - src/main/webapp/WEB-INF/jsp/listStudents.jsp
   - src/main/webapp/WEB-INF/jsp/studentForm.jsp
   - src/main/webapp/WEB-INF/jsp/viewStudent.jsp

4. **Check application.properties:**
   ```properties
   spring.mvc.view.prefix=/WEB-INF/jsp/
   spring.mvc.view.suffix=.jsp
   ```

---

**Remember:** Use the NEW URLs starting with `/students/` not `/addStudent`!

**Main URL:** http://localhost:8080/students/list

---

Good luck! 🚀
