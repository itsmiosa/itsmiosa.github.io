<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Objects" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
          @import url("https://fonts.cdnfonts.com/css/product-sans");
    
        body {
            font-family: "Product Sans", sans-serif;
            background-image: url("https://static.vecteezy.com/system/resources/previews/030/639/865/non_2x/library-image-hd-free-photo.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center;
            background-color: rgb(30, 21, 17);
        }
        .DeleteBook {
            display: inline-block;
            font-size: medium;
            width: 100%;
            color: rgb(232, 232, 232);
            border: none;
            border-radius: 70px;
            text-align: center;
            text-decoration: none;
            background-color: rgb(34, 34, 34);
            padding: 10px;
        }
        .DeleteBook:hover {
            background-color: gray;
            cursor: pointer;
        }
        .BackButton {
            display: inline-block;
            font-size: medium;
            width: 20%;
            color: rgb(232, 232, 232);
            border: none;
            border-radius: 70px;
            text-align: center;
            text-decoration: none;
            background-color: rgb(34, 34, 34);
            margin-top: 20px;
			padding: 14px;
        }
        .BackButton:hover {
            background-color: gray;
        }
        .container {
            margin: auto;
            width: 80%;
            background-color: rgb(255, 255, 255);
            margin-top: 2%;
            border: 0px;
            border-radius: 30px;
            padding: 40px;
        }
        .Header {
            text-align: center;
            color: rgb(34, 34, 34);
            margin-bottom: 40px;
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid rgb(34, 34, 34);
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: rgb(34, 34, 34);
            color: white;
        }
        .notAvailable {
            font-weight: bold;
            font-size: large;
            margin-bottom: 0px;
            color: red;
        }
        .criarConta {
            display: inline-block;
            font-size: medium;
            width: 20%;
            color: rgb(232, 232, 232);
            background-color: rgb(34, 34, 34);
            padding: 14px;
            margin: 8px;
            border: none;
            border-radius: 25px;
            text-align: center;
            text-decoration: none;
        }
        th {
        	text-align: center;
        }
        .criarConta:hover {
            background-color: gray;
        }
        @media (max-width: 600px) {
            .DeleteUser {
                width: 100%;
            }
            .BackButton {
                width: 92%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="Header">Books available in our library!</h1>   		
        <% 
        List<Object[]> books = (List<Object[]>) request.getAttribute("books");
        if (books != null && !books.isEmpty()) {
        %>
        <table>
            <tr>
                <th>ISBN</th>
                <th>Title</th>
                <th>Author</th>
                <th>Synopsis</th>
                <th>Genre</th>
                <th>Available</th>
                <th>Number copies</th>
                <th>Number borrowed</th>
                <th>Delete book</th>
            </tr>
            <% for (Object[] book : books) {
            	String isbn = (String) book[0];
                String title = (String) book[1];
                String author = (String) book[2];
                String abstractText = (String) book[3];
                String genre = (String) book[4];
                boolean available = (boolean) book[5];
                int numberCopies = (int) book[6];
                int numberBorrowed = (int) book[7];
                
                int copiesAvailable = numberCopies - numberBorrowed;
            %>
            <tr>
                <td><%= isbn %></td>
                <td><%= title %></td>
                <td><%= author %></td>
                <td><%= abstractText %></td>
                <td><%= genre %></td>
                <td><%= available %></td>
                <td><%= numberCopies %></td>
                <td><%= numberBorrowed %></td>
                <td>
                    <form action="ManageBooksServlet" method="post">
                        <input type="hidden" name="isbn" value="<%= isbn %>">
                        <input class="DeleteBook" type="submit" value="Delete book">
                    </form>
                </td>
            </tr>
            <% } %>
        </table>
        <% } else { %>
        <p>No books registered!</p>
        <% } %>
        <div>
        <a class="BackButton" href="/TrabalhoFinal">Go back</a>
        <a class="BackButton" href="admin/createBook.jsp" class="criarLivro">Add new book</a> 
        </div>
    </div>
</body>
</html>
