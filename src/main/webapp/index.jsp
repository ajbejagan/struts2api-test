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
</head>
<body>
    <main class="flex items-center justify-center min-h-screen bg-gray-200">
        <form action="login" class="flex flex-col items-center justify-center bg-white px-16 py-14 rounded-md shadow-md">
          <h1 class="text-2xl text-green-600 font-bold mb-5">Login</h1>
          <input class="w-60 p-2 border border-gray-200 rounded-md mb-2" type="text" name="username" id="username" placeholder="username">
          <input class="w-60 p-2 border border-gray-200 rounded-md mb-2" type="password" name="password" id="password" placeholder="password">
          <button class="w-full text-white font-semibold p-2 bg-green-500 border border-green-600 rounded-md mb-4" type="submit">Login</button>
          <p class="text-sm text-gray-400">Don't have an account? <a class="underline" href="#">Register</a></p>
        </form>
    </main>
</body>
</html>