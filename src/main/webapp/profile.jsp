<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>
    <div class="flex flex-col items-center min-h-screen bg-gray-200">
        <div class="w-full max-w-screen-lg">
          <header class="py-5">
            <nav class="flex items-center justify-between">
              <h1 class="text-green-600 font-semibold">Struts2Project</h1>
              <ul class="flex items-center justify-between">
                <li class="font-semibold">
                  <a class="text-white bg-green-600 px-4 py-2 rounded-md" href="#">Profile</a>
                </li>
                <li class="font-semibold">
                  <a class="text-gray-900 px-4 py-2 rounded-md" href="#">User List</a>
                </li>
              </ul>
            </nav>
          </header>
          <main class="bg-white px-5 py-5 rounded-md">
            <h1 class="text-xl text-green-600 font-semibold mb-2.5"><s:property value="user.firstname" />'s Profile</h1>
            <div class="flex">
              <img class="rounded-md" src="http://placekitten.com/200" alt="">
              <div class="ml-5">
                <p class="flex items-start">
                  <span class="shrink-0 w-20 text-sm text-gray-500 font-semibold">First name</span>
                  <span class="text-sm text-gray-800"><s:property value="user.firstname" /></span>
                </p>
                <p class="flex items-start">
                  <span class="shrink-0 w-20 text-sm text-gray-500 font-semibold">Last name</span>
                  <span class="text-sm text-gray-800">Meow</span>
                </p>
                <p class="flex items-start">
                  <span class="shrink-0 w-20 text-sm text-gray-500 font-semibold">Age</span>
                  <span class="text-sm text-gray-800">24</span>
                </p>
                <p class="flex items-start">
                  <span class="shrink-0 w-20 text-sm text-gray-500 font-semibold">Email</span>
                  <span class="text-sm text-gray-800"><s:property value="user.email" /></span>
                </p>
                <p class="flex items-start">
                  <span class="shrink-0 w-20 text-sm text-gray-500 font-semibold">Bio</span>
                  <span class="text-sm text-gray-800">Lorem ipsum dolor sit amet consectetur adipisicing elit. At impedit fuga dolor qui ut dolores temporibus omnis fugiat. At magnam vero, quas enim nemo laudantium blanditiis provident odio reiciendis nesciunt?</span>
                </p>
              </div>
            </div>
          </main>
          <footer></footer>
        </div>
    </div>
</body>
</html>