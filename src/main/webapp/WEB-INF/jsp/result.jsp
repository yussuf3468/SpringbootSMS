<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Added</title>
    <style>
        :root{--bg:#f6f8fa;--card:#ffffff;--accent:#4a90e2;--muted:#6b7280}
        body{background:var(--bg);font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;margin:0;padding:40px}
        .container{max-width:720px;margin:0 auto}
        .card{background:var(--card);border-radius:8px;padding:28px;box-shadow:0 6px 18px rgba(20,20,20,0.06)}
        h1{margin-top:0;color:#0f172a}
        .row{display:flex;gap:12px}
        .label{color:var(--muted);width:120px}
        .value{font-weight:600;color:#0f172a}
        .actions{margin-top:18px}
        .btn{background:var(--accent);color:white;border:none;padding:8px 14px;border-radius:6px;text-decoration:none}
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h1>Student Saved</h1>
        <p class="lead">The submitted values are shown below.</p>

        <div class="row"><div class="label">Name:</div><div class="value"><c:out value="${name}"/></div></div>
        <div class="row"><div class="label">Age:</div><div class="value"><c:out value="${age}"/></div></div>
        <div class="row"><div class="label">ID:</div><div class="value"><c:out value="${id}"/></div></div>

        <div class="actions"><a class="btn" href="/addStudent">Add another</a></div>
    </div>
</div>
</body>
</html>
