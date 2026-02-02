<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        :root{
            --bg:#f6f8fa;
            --card:#ffffff;
            --accent:#4a90e2;
            --muted:#6b7280;
            --danger:#e74c3c;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        body{background:var(--bg);margin:0;padding:40px;}
        .container{max-width:720px;margin:0 auto}
        .card{background:var(--card);border-radius:8px;padding:28px;box-shadow:0 6px 18px rgba(20,20,20,0.06)}
        h1{margin-top:0;color:#0f172a}
        p.lead{color:var(--muted);margin-top:6px}
        form .row{display:flex;gap:16px}
        .field{flex:1;display:flex;flex-direction:column;margin-bottom:14px}
        label{font-weight:600;margin-bottom:6px;color:#0f172a}
        input[type="text"], input[type="number"]{padding:10px 12px;border:1px solid #e6e9ee;border-radius:6px;font-size:14px}
        .errors{color:var(--danger);font-size:13px;margin-top:6px}
        .actions{display:flex;gap:10px;align-items:center}
        .btn{background:var(--accent);color:white;border:none;padding:10px 16px;border-radius:6px;cursor:pointer}
        .btn.secondary{background:#e6edf8;color:var(--accent)}
        .meta{margin-top:12px;color:var(--muted);font-size:13px}
        .field .hint{font-size:12px;color:var(--muted);margin-top:6px}
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h1>Add Student</h1>
        <p class="lead">Fill the form below and submit to see a styled result page.</p>

        <form:form method="post" modelAttribute="student">
            <div class="row">
                <div class="field">
                    <label for="name">Name</label>
                    <form:input path="name" id="name" />
                    <form:errors path="name" cssClass="errors" />
                    <div class="hint">Enter the full name (1-150 chars)</div>
                </div>
                <div class="field">
                    <label for="age">Age</label>
                    <form:input path="age" id="age" type="number" />
                    <form:errors path="age" cssClass="errors" />
                    <div class="hint">Valid range: 1 - 60</div>
                </div>
            </div>

            <div class="field">
                <label for="id">ID (optional)</label>
                <form:input path="id" id="id" type="number" />
                <form:errors path="id" cssClass="errors" />
            </div>

            <div class="actions">
                <button class="btn" type="submit">Submit</button>
                <a class="btn secondary" href="/addStudent">Reset</a>
            </div>
        </form:form>

        <div class="meta">Server-side validation is applied. Try submitting empty values to see errors.</div>
    </div>
</div>
</body>
</html>
