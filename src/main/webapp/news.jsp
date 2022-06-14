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
<body class="bg-gray-200">
    <div class="xl:max-w-screen-lg flex flex-col items-center justify-center p-5 mx-auto">
        <div class="flex flex-row items-center justify-between w-full text-center bg-blue-500 p-5 shadow-md">
            <h1 class="text-2xl text-white font-bold">Today's News</h1>
            <form action="news" class="flex flex-row items-center">
                <s:textfield cssClass="w-60 p-2 border border-gray-200 rounded-md mr-[5px]" type="text" name="searchKeyword" placeholder="Search for a topic..." />
                <s:select
                    cssClass="p-2 border border-gray-200 rounded-md mr-[5px]"
                    list="{'date published', 'relevancy', 'popularity'}" 
                    name="sortBy" 
                    value="sortBy"
                />
                <s:select
                    cssClass="p-2 border border-gray-200 rounded-md mr-[5px]"
                    list="{'en', 'es', 'fr'}" 
                    name="language" 
                    value="language"
                />
                <s:submit cssClass="block w-full text-white font-semibold px-4 py-2 bg-green-500 border border-green-600 rounded-md cursor-pointer" value="Search" />
            </form>
        </div>
        <div class="flex flex-wrap items-center justify-center gap-[10px] w-full bg-white p-5 shadow-md">
            <s:iterator value="newsResponse.articles">
                <div class="w-half self-stretch bg-gray-100 border-b-[5px] border-blue-500 rounded-md shadow-md overflow-hidden">
                    <div class="w-full h-[400px] mb-[10px]">
                        <img class="w-full h-full object-cover" src="<s:property value="urlToImage"/>" alt="">
                    </div>
                    <div class="p-5">
                        <p class="text-xs text-gray-500 font-semibold italic mb-[5px]">
                            Published at <s:property value="publishedAt"/>
                        </p>
                        <h1 class="block text-lg text-blue-500 font-bold mb-[5px]">
                            <s:property value="title"/>
                        </h1>
                        <p class="text-sm text-gray-800 font-semibold mb-[5px]">
                            <span class="text-gray-400">by </span>
                            <s:if test="%{author==null}">
                                Anonymous
                            </s:if>
                            <s:else>
                                <s:property value="author"/>
                            </s:else>
                        </p>
                        <p class="text-base text-gray-900 mb-[8px]">
                            <s:property value="description"/>
                        </p>
                        <s:url value="url" var="readMoreURL" />
                        <s:a cssClass="text-blue-500 font-semibold italic underline" href="%{readMoreURL}">Read more</s:a>
                    </div>
                </div>
            </s:iterator>
        </div>
    </div>
</body>
</html>