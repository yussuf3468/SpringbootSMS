<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        :root {
            --primary: #4a90e2;
            --success: #28a745;
            --danger: #dc3545;
            --warning: #ffc107;
            --dark: #343a40;
            --light: #f8f9fa;
            --border: #dee2e6;
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            padding: 20px;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 30px;
            text-align: center;
        }
        .header h1 {
            font-size: 2.5em;
            margin-bottom: 10px;
        }
        .header p {
            opacity: 0.9;
            font-size: 1.1em;
        }
        .toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 30px;
            background: var(--light);
            border-bottom: 2px solid var(--border);
            flex-wrap: wrap;
            gap: 15px;
        }
        .search-box {
            display: flex;
            gap: 10px;
            flex: 1;
            max-width: 400px;
        }
        .search-box input {
            flex: 1;
            padding: 10px 15px;
            border: 2px solid var(--border);
            border-radius: 6px;
            font-size: 14px;
        }
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 600;
            text-decoration: none;
            display: inline-block;
            transition: all 0.3s;
        }
        .btn-primary {
            background: var(--primary);
            color: white;
        }
        .btn-primary:hover {
            background: #357abd;
            transform: translateY(-2px);
        }
        .btn-success {
            background: var(--success);
            color: white;
        }
        .btn-danger {
            background: var(--danger);
            color: white;
            font-size: 12px;
            padding: 6px 12px;
        }
        .btn-warning {
            background: var(--warning);
            color: var(--dark);
            font-size: 12px;
            padding: 6px 12px;
        }
        .btn-info {
            background: #17a2b8;
            color: white;
            font-size: 12px;
            padding: 6px 12px;
        }
        .alert {
            padding: 15px 30px;
            margin: 20px 30px;
            border-radius: 6px;
            font-weight: 500;
        }
        .alert-success {
            background: #d4edda;
            color: #155724;
            border-left: 4px solid var(--success);
        }
        .alert-error {
            background: #f8d7da;
            color: #721c24;
            border-left: 4px solid var(--danger);
        }
        .stats {
            padding: 20px 30px;
            background: #f8f9fa;
            border-bottom: 1px solid var(--border);
        }
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
        }
        .stat-card {
            background: white;
            padding: 20px;
            border-radius: 8px;
            border-left: 4px solid var(--primary);
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        .stat-card h3 {
            color: var(--primary);
            font-size: 2em;
            margin-bottom: 5px;
        }
        .stat-card p {
            color: #6c757d;
            font-size: 0.9em;
        }
        .content {
            padding: 30px;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        thead {
            background: var(--dark);
            color: white;
        }
        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid var(--border);
        }
        th {
            font-weight: 600;
            text-transform: uppercase;
            font-size: 12px;
            letter-spacing: 0.5px;
        }
        tbody tr {
            transition: background 0.2s;
        }
        tbody tr:hover {
            background: #f8f9fa;
        }
        .actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }
        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #6c757d;
        }
        .empty-state svg {
            width: 120px;
            height: 120px;
            margin-bottom: 20px;
            opacity: 0.3;
        }
        .empty-state h3 {
            font-size: 1.5em;
            margin-bottom: 10px;
        }
        .badge {
            padding: 4px 10px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            text-transform: uppercase;
        }
        .badge-primary {
            background: #e3f2fd;
            color: #1976d2;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>🎓 Student Management System</h1>
        <p>Manage your students efficiently</p>
    </div>

    <div class="toolbar">
        <form action="${pageContext.request.contextPath}/students/list" method="get" class="search-box">
            <input type="text" name="search" placeholder="Search by name..." value="${search}">
            <button type="submit" class="btn btn-primary">Search</button>
        </form>
        <a href="${pageContext.request.contextPath}/students/add" class="btn btn-success">+ Add New Student</a>
    </div>

    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-error">${errorMessage}</div>
    </c:if>

    <div class="stats">
        <div class="stats-grid">
            <div class="stat-card">
                <h3>${totalCount}</h3>
                <p>Total Students</p>
            </div>
            <div class="stat-card" style="border-left-color: var(--success);">
                <h3><c:out value="${students.size()}"/></h3>
                <p>Currently Showing</p>
            </div>
        </div>
    </div>

    <div class="content">
        <c:choose>
            <c:when test="${not empty students}">
                <div class="table-container">
                    <table>
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Age</th>
                            <th>Email</th>
                            <th>Course</th>
                            <th>Phone</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="student" items="${students}">
                            <tr>
                                <td><span class="badge badge-primary">#${student.id}</span></td>
                                <td><strong>${student.name}</strong></td>
                                <td>${student.age}</td>
                                <td>${student.email}</td>
                                <td>${student.course}</td>
                                <td>${student.phoneNumber != null ? student.phoneNumber : 'N/A'}</td>
                                <td>
                                    <div class="actions">
                                        <a href="${pageContext.request.contextPath}/students/view/${student.id}" class="btn btn-info">View</a>
                                        <a href="${pageContext.request.contextPath}/students/edit/${student.id}" class="btn btn-warning">Edit</a>
                                        <a href="${pageContext.request.contextPath}/students/delete/${student.id}"
                                           class="btn btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253"/>
                    </svg>
                    <h3>No Students Found</h3>
                    <p>Start by adding your first student to the system.</p>
                    <br>
                    <a href="${pageContext.request.contextPath}/students/add" class="btn btn-primary">Add First Student</a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>
