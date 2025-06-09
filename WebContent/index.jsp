<%@ page
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    language="java"
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Validated Sign-up Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f4f4;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }
    .form-container {
      background: #fff;
      padding: 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      width: 350px;
    }
    h2 {
      text-align: center;
      margin-bottom: 20px;
    }
    .form-group {
      position: relative;
      margin-bottom: 20px;
    }
    .form-group label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    .form-group input {
      width: 100%;
      padding: 8px;
      font-size: 14px;
      box-sizing: border-box;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    /* highlight invalid fields */
    .form-group input:invalid {
      border-color: #e74c3c;
    }
    /* hide all error messages by default */
    .form-group .error {
      display: none;
      position: absolute;
      bottom: -18px;
      left: 0;
      background: #e74c3c;
      color: white;
      font-size: 12px;
      padding: 2px 6px;
      border-radius: 3px;
    }
    /* show “Required” under any required field that is showing invalid state */
    .form-group input:required:invalid + .error {
      display: inline-block;
    }
    .btn-group {
      display: flex;
      gap: 10px;
      justify-content: space-between;
    }
    .btn-group input {
      flex: 1;
      padding: 10px;
      border: none;
      border-radius: 4px;
      font-size: 14px;
      cursor: pointer;
    }
    .btn-group input[type="submit"] {
      background: #3498db;
      color: #fff;
    }
    .btn-group input[type="reset"] {
      background: #95a5a6;
      color: #fff;
    }
    
  </style>
</head>
<body>

<style>
  body {
    /* use JSP context-path so it works off any URL */
    background: url('<%= request.getContextPath() %>/images/lg.jpg')
                no-repeat center center fixed;
    background-size: cover;
  }
</style>

<% String successMsg = (String) request.getAttribute("successMsg"); %>
<% if (successMsg != null) { %>
  <!-- SUCCESS: show only this banner -->
  <div class="form-container">
    <h2 style="color: green; text-align: center;">
      <%= successMsg %>
    </h2>
  </div>
<% } else { %>
  <!-- NO CHANGE HERE: your original form, validation and layout live on -->

  <div class="form-container">
    <h2>User Sign-up Form</h2>
    <form action="<%= request.getContextPath() %>/SignupServlet" method="post">
      
      <!-- 1 & 3: Username α-only, max 10 chars -->
      <div class="form-group">
        <label for="username">Username</label>
        <input
          type="text"
          id="username"
          name="username"
          required
          maxlength="10"
        
          title="Only letters, up to 10 chars"
        />
        <span class="error">Required</span>
      </div>

<div class="form-group">
        <label for="useremail">User Email</label>
        <input
          type="text"
          id="useremail"
          name="useremail"
          required
      
        />
        <span class="error">Required</span>
      </div>
      
      <!-- 2 & 5: Password 7–10 chars, allowed 0-9, A-Z, a-z, $, %, &, * -->
      <div class="form-group">
        <label for="password">Password</label>
        <input
          type="password"
          id="password"
          name="password"
          required
          minlength="7"
          maxlength="10"
          pattern="[A-Za-z0-9\$%&\*]{7,10}"
          title="7–10 chars: letters, numbers, $,%,&,*"
        />
        <span class="error">Required</span>
      </div>

<div class="form-group">
        <input
          type="password"
          id="password"
          name="password"
          required
          minlength="7"
          maxlength="10"
          pattern="[A-Za-z0-9\$%&\*]{7,10}"
          title="7–10 chars: letters, numbers, $,%,&,*"
        />
        <span class="error">Required</span>
      </div>


      <!-- 6: Full Name max 20 chars -->
      <div class="form-group">
        <label for="preferredname">Preferred Name</label>
        <input
          type="text"
          id="preferredname"
          name="preferredname"
          maxlength="20"
          title="Up to 20 characters"
        />
        <span class="error">Required</span>
      </div>

 <div class="form-group">
        <label for="name">Name</label>
        <input
          type="text"
          id="name"
          name="name"
          required
           maxlength="20"
          title="Only letters, up to 20 chars"
        />
        <span class="error">Required</span>
      </div>
      
      <div class="btn-group">
        <input type="submit" value="Submit" />
        <input type="reset" value="Reset" />
      </div>
      
      
    </form>
  </div>

<% } %>

</body>
</html>
