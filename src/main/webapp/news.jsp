<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>News</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style type="text/tailwindcss">
        @layer utilities {
          .w-half {
            width: calc(50% - 10px);
          }
        }
    </style>
</head>
<body class="bg-gray-100">
    <div class="xl:max-w-screen-lg flex flex-col items-center justify-center p-5 mx-auto">
        <div class="w-full text-center bg-blue-500 p-5 rounded-md shadow-md mb-[20px]">
            <h1 class="text-2xl text-white font-bold">Today's News</h1>
        </div>
        <div class="flex flex-wrap items-center justify-center gap-[10px] w-full bg-white p-5 rounded-md shadow-md">
            <s:iterator value="newsResponse.articles">
                <div class="w-half self-stretch bg-gray-50 border-b-[5px] border-blue-500 shadow-md">
                <div class="w-full h-[400px] mb-[10px]">
                    <img class="w-full h-full object-cover" src="<s:property value="urlToImage"/>" alt="">
                </div>
                <div class="p-5">
                    <h1 class="block text-lg text-blue-500 font-bold mb-[5px]">
                        <s:property value="title"/>
                    </h1>
                    <p class="text-sm text-gray-800 font-semibold mb-[5px]">
                        <span class="text-gray-400">Author: </span><s:property value="author"/>
                    </p>
                    <p class="text-base text-gray-900">
                        <s:property value="content"/>
                    </p>
                </div>
                </div>
            </s:iterator>
        </div>
    </div>
    <!-- <s:iterator value="newsResponse.articles">
        <s:property value="title"/>
        <s:property value="author"/>
        <s:property value="description"/>
    </s:iterator> -->
</body>
</html>