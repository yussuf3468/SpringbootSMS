<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details - ${student.name}</title>
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
        .details-container {
            max-width: 800px;
            width: 100%;
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            overflow: hidden;
        }
        .details-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 40px;
            text-align: center;
            position: relative;
        }
        .student-avatar {
            width: 120px;
            height: 120px;
            background: white;
            border-radius: 50%;
            margin: 0 auto 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3em;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        .details-header h1 {
            font-size: 2em;
            margin-bottom: 5px;
        }
        .badge {
            display: inline-block;
            padding: 5px 15px;
            background: rgba(255,255,255,0.2);
            border-radius: 20px;
            font-size: 0.9em;
            margin-top: 10px;
        }
        .details-body {
            padding: 40px;
        }
        .info-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 30px;
        }
        .info-item {
            padding: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            border-left: 4px solid var(--primary);
        }
        .info-label {
            font-size: 12px;
            text-transform: uppercase;
            color: #6c757d;
            font-weight: 600;
            letter-spacing: 0.5px;
            margin-bottom: 8px;
        }
        .info-value {
            font-size: 1.2em;
            color: var(--dark);
            font-weight: 600;
        }
        .timestamp-section {
            background: #e9ecef;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }
        .timestamp-section h3 {
            font-size: 14px;
            color: #6c757d;
            margin-bottom: 15px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .timestamp-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }
        .timestamp-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .timestamp-item svg {
            width: 20px;
            height: 20px;
            color: #6c757d;
        }
        .timestamp-content {
            flex: 1;
        }
        .timestamp-label {
            font-size: 11px;
            color: #6c757d;
            text-transform: uppercase;
        }
        .timestamp-value {
            font-size: 13px;
            color: var(--dark);
            font-weight: 500;
        }
        .actions {
            display: flex;
            gap: 15px;
            padding-top: 20px;
            border-top: 2px solid var(--border);
        }
        .btn {
            padding: 12px 24px;
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
        }
        .btn-primary:hover {
            background: #357abd;
            transform: translateY(-2px);
        }
        .btn-warning {
            background: #ffc107;
            color: var(--dark);
        }
        .btn-danger {
            background: var(--danger);
            color: white;
        }
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
    </style>
</head>
<body>
<div class="details-container">
    <div class="details-header">
        <div class="student-avatar">👤</div>
        <h1>${student.name}</h1>
        <div class="badge">Student ID: #${student.id}</div>
    </div>

    <div class="details-body">
        <div class="info-grid">
            <div class="info-item">
                <div class="info-label">📧 Email Address</div>
                <div class="info-value">${student.email}</div>
            </div>

            <div class="info-item" style="border-left-color: var(--success);">
                <div class="info-label">🎓 Course</div>
                <div class="info-value">${student.course}</div>
            </div>

            <div class="info-item" style="border-left-color: #ffc107;">
                <div class="info-label">🎂 Age</div>
                <div class="info-value">${student.age} years old</div>
            </div>

            <div class="info-item" style="border-left-color: #17a2b8;">
                <div class="info-label">📱 Phone Number</div>
                <div class="info-value">${student.phoneNumber != null ? student.phoneNumber : 'Not provided'}</div>
            </div>
        </div>

        <div class="timestamp-section">
            <h3>⏱️ Record Information</h3>
            <div class="timestamp-grid">
                <div class="timestamp-item">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"/>
                    </svg>
                    <div class="timestamp-content">
                        <div class="timestamp-label">Created At</div>
                        <div class="timestamp-value">
                            <c:out value="${student.createdAt}" />
                        </div>
                    </div>
                </div>

                <div class="timestamp-item">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 4v5h.582m15.356 2A8.001 8.001 0 004.582 9m0 0H9m11 11v-5h-.581m0 0a8.003 8.003 0 01-15.357-2m15.357 2H15"/>
                    </svg>
                    <div class="timestamp-content">
                        <div class="timestamp-label">Last Updated</div>
                        <div class="timestamp-value">
                            <c:out value="${student.updatedAt}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="actions">
            <a href="${pageContext.request.contextPath}/students/edit/${student.id}" class="btn btn-warning">✏️ Edit Student</a>
            <a href="${pageContext.request.contextPath}/students/delete/${student.id}"
               class="btn btn-danger"
               onclick="return confirm('Are you sure you want to delete this student?');">🗑️ Delete</a>
            <a href="${pageContext.request.contextPath}/students/list" class="btn btn-secondary">← Back to List</a>
        </div>
    </div>
</div>
</body>
</html>
