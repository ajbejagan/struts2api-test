<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
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
      <form action="register.action" class="flex flex-col items-center justify-center bg-white px-16 py-14 rounded-md shadow-md">
        <h1 class="text-2xl text-green-600 font-bold mb-5">Create Account</h1>
        <div class="flex items-center justify-between">
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mr-2 mb-2" type="text" name="userBean.firstname" placeholder="first name" />
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mb-2" type="text" name="userBean.lastname" placeholder="last name" />
        </div>
        <div class="flex items-center justify-between">
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mr-2 mb-2 appearance-none" type="number" name="userBean.age" placeholder="age" />
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mb-2" type="email" name="userBean.email" placeholder="email" />
        </div>
        <div class="flex items-center justify-between">
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mr-2 mb-2" type="text" name="userBean.username" placeholder="username" />
          <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mb-2" type="password" name="userBean.password" placeholder="password" />
        </div>
        <s:submit cssClass="block w-full text-white font-semibold p-2 bg-green-500 border border-green-600 rounded-md mb-4 cursor-pointer" value="Create Account" />
        <p class="text-sm text-gray-400">Already have an account? <a class="underline" href="#">Login</a></p>
      </form>
    </main>
</body>
</html>