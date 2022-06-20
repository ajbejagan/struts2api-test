<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rick&Morty</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style type="text/tailwindcss">
        @layer utilities {
          .w-half {
            width: calc(50% - 10px);
          }

          .w-third {
            width: calc(33% - 10px);
          }
        }
    </style>
</head>
<body class="bg-neutral-900">
    <div class="w-full lg:max-w-screen-md xl:max-w-screen-lg flex flex-col items-center justify-center mx-auto">
      <div class="flex flex-row items-center justify-between w-full text-center bg-neutral-800 p-5 shadow-md">
        <h1 class="text-2xl text-white font-bold">Rick&Morty</h1>
        <form action="rickandmorty" class="flex flex-row items-center">
            <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mr-[5px]" type="text" name="query" placeholder="Search for a character..." />
            <s:submit cssClass="block w-full text-white font-semibold px-4 py-2 bg-blue-500 border border-blue-600 rounded-md cursor-pointer" value="Search" />
        </form>
      </div>
      <div class="flex flex-wrap items-center justify-center gap-[10px] w-full p-5">
        <s:iterator value="charactersResponse.results">
          <div class="w-half md:w-third self-stretch bg-neutral-600 rounded-md shadow-md overflow-hidden">
            <div class="relative w-full h-0 pt-[100%]">
              <img class="absolute top-0 right-0 bottom-0 left-0 w-full h-full object-cover" src="<s:property value="image"/>" alt="">
            </div>
            <div class="p-2">
              <h1 class="block text-xl text-white font-bold mb-[2px]">
                <s:property value="name"/>
              </h1>
              <div class="flex items-center justify-start mb-[4px]">
                <s:if test="%{status=='Alive'}">
                  <span class="p-[5px] bg-green-500 rounded-full"></span>
                </s:if>
                <s:else>
                  <span class="p-[5px] bg-red-500 rounded-full"></span>
                </s:else>
                <p class="text-sm text-white italic mx-[5px]">
                  <s:property value="status"/>
                </p>
                <p class="text-sm text-white font-semibold">
                  (<s:property value="species"/>)
                </p>
              </div>
              <div class="mb-[4px]">
                <p class="text-base text-white font-semibold">
                  Last known location:
                </p>
                <p class="text-sm text-neutral-300">
                  <s:property value="location.name"/>
                </p>
              </div>
            </div>
          </div>
        </s:iterator>
      </div>
      <!-- <div class="flex items-center justify-center gap-x-[10px]">
        
      </div> -->
    </div>
</body>
</html>