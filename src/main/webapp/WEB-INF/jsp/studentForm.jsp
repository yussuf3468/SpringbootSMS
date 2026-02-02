<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><c:if test="${action == 'add'}">Add New</c:if><c:if test="${action == 'edit'}">Edit</c:if> Student</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        :root {
            --primary: #4a90e2;
            --success: #28a745;
            --danger: #dc3545;
            --dark: #343a40;
            --border: #dee2e6;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .form-container {
            max-width: 700px;
            width: 100%;
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        .form-header h1 {
            font-size: 2em;
            margin-bottom: 5px;
        }
        .form-header p {
            opacity: 0.9;
        }
        .form-body {
            padding: 40px;
        }
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group.full-width {
            grid-column: 1 / -1;
        }
        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: var(--dark);
            font-size: 14px;
        }
        label .required {
            color: var(--danger);
        }
        input, textarea, select {
            width: 100%;
            padding: 12px 15px;
            border: 2px solid var(--border);
            border-radius: 6px;
            font-size: 14px;
            font-family: inherit;
            transition: border-color 0.3s;
        }
        input:focus, textarea:focus, select:focus {
            outline: none;
            border-color: var(--primary);
        }
        .error {
            color: var(--danger);
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }
        .hint {
            color: #6c757d;
            font-size: 12px;
            margin-top: 5px;
            display: block;
        }
        .form-actions {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 2px solid var(--border);
        }
        .btn {
            padding: 12px 30px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
            text-align: center;
        }
        .btn-primary {
            background: var(--primary);
            color: white;
            flex: 1;
        }
        .btn-primary:hover {
            background: #357abd;
            transform: translateY(-2px);
        }
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        .btn-secondary:hover {
            background: #5a6268;
        }
        .back-link {
            text-align: center;
            margin-top: 20px;
        }
        .back-link a {
            color: #6c757d;
            text-decoration: none;
            font-size: 14px;
        }
        .back-link a:hover {
            color: var(--primary);
        }
        input.error-input {
            border-color: var(--danger);
        }
    </style>
</head>
<body>
<div class="form-container">
    <div class="form-header">
        <h1>
            <c:if test="${action == 'add'}">➕ Add New Student</c:if>
            <c:if test="${action == 'edit'}">✏️ Edit Student</c:if>
        </h1>
        <p>Fill in the student information below</p>
    </div>

    <div class="form-body">
        <c:set var="formAction" value="${action == 'add' ? '/students/add' : '/students/edit/'.concat(student.id)}" />
        <form:form method="post" modelAttribute="student" action="${pageContext.request.contextPath}${formAction}">
            
            <div class="form-row">
                <div class="form-group">
                    <label for="name">Full Name <span class="required">*</span></label>
                    <form:input path="name" id="name" cssClass="${not empty errors and errors.hasFieldErrors('name') ? 'error-input' : ''}" placeholder="John Doe"/>
                    <form:errors path="name" cssClass="error"/>
                    <span class="hint">Enter student's full name (2-100 characters)</span>
                </div>

                <div class="form-group">
                    <label for="age">Age <span class="required">*</span></label>
                    <form:input path="age" id="age" type="number" min="1" max="60" cssClass="${not empty errors and errors.hasFieldErrors('age') ? 'error-input' : ''}" placeholder="20"/>
                    <form:errors path="age" cssClass="error"/>
                    <span class="hint">Age must be between 1 and 60</span>
                </div>
            </div>

            <div class="form-group full-width">
                <label for="email">Email Address <span class="required">*</span></label>
                <form:input path="email" id="email" type="email" cssClass="${not empty errors and errors.hasFieldErrors('email') ? 'error-input' : ''}" placeholder="student@example.com"/>
                <form:errors path="email" cssClass="error"/>
                <span class="hint">Must be a valid email address</span>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="course">Course <span class="required">*</span></label>
                    <form:input path="course" id="course" cssClass="${not empty errors and errors.hasFieldErrors('course') ? 'error-input' : ''}" placeholder="Computer Science"/>
                    <form:errors path="course" cssClass="error"/>
                    <span class="hint">Student's enrolled course</span>
                </div>

                <div class="form-group">
                    <label for="phoneNumber">Phone Number</label>
                    <form:input path="phoneNumber" id="phoneNumber" type="tel" placeholder="+1234567890" cssClass="${not empty errors and errors.hasFieldErrors('phoneNumber') ? 'error-input' : ''}"/>
                    <form:errors path="phoneNumber" cssClass="error"/>
                    <span class="hint">Optional (max 15 characters)</span>
                </div>
            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <c:if test="${action == 'add'}">💾 Add Student</c:if>
                    <c:if test="${action == 'edit'}">💾 Update Student</c:if>
                </button>
                <a href="${pageContext.request.contextPath}/students/list" class="btn btn-secondary">Cancel</a>
            </div>
        </form:form>

        <div class="back-link">
            <a href="${pageContext.request.contextPath}/students/list">← Back to Student List</a>
        </div>
    </div>
</div>
</body>
</html>
