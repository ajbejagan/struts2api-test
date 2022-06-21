<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style type="text/tailwindcss">
        @layer utilities {
          .formButton {
            @apply w-full;
          }
        }
    </style>
</head>
<body>
    <main class="flex items-center justify-center min-h-screen bg-gray-200">
        <form action="login" class="flex flex-col items-center justify-center bg-white px-16 py-14 rounded-md shadow-md">
          <h1 class="text-2xl text-green-600 font-bold mb-5">Sign in</h1>
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mb-2" type="text" name="accountBean.username" placeholder="username" />
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mb-2" type="password" name="accountBean.password" placeholder="password" />
          <s:submit cssClass="block w-full text-white font-semibold p-2 bg-green-500 border border-green-600 rounded-md cursor-pointer" value="Login" />
          <hr class="w-full h-[1px] bg-neutral-300 my-[15px]" />
          <!-- <s:url value="https://struts2api-test.hub.loginradius.com/auth.aspx?action=login&return_url=https://struts2api-test.hub.loginradius.com/profile.aspx" var="loginRadius_Login" /> -->
          <s:url value="https://struts2api-test.hub.loginradius.com/auth.aspx?action=login&return_url=http://localhost:8080/profile.jsp" var="loginRadius_Login" />
          <s:a
            class="block w-full text-white text-center font-semibold p-2 bg-blue-500 border border-blue-600 rounded-md cursor-pointer mb-4"
            href="%{loginRadius_Login}"
          >
            Login with LoginRadius
          </s:a>
          <p class="text-sm text-gray-400">
              Don't have an account?&nbsp;
              <!-- <s:url action="register" var="toRegister" /> -->
              <s:url value="https://struts2api-test.hub.loginradius.com/auth.aspx?action=register&return_url=http://localhost:8080/" var="loginRadius_Register" />
              <s:a class="underline" href="%{loginRadius_Register}">Register</s:a>
          </p>
        </form>
    </main>
</body>
</html>