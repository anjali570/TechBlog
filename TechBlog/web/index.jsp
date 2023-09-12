
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 68% 87%, 34% 100%, 0 86%, 0 0);            
            }
        </style>

    </head>
    <body>
        
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>
        
        <!--banner-->
        <div class="container-fluid p-0 m-0 banner-background">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                <h3 class="display-3">Welcome, friends!</h3>
                <p>Welcome to 'TechBlog,' your ultimate destination for insightful and engaging content. Our blogging website is designed to cater to a diverse range of interests, of various technology. With a user-friendly interface, navigating through our collection of thought-provoking articles, personal stories, and expert opinions is a breeze.'TechBlog' offers something for everyone. Join our community, explore new ideas, and share your thoughts through blogs and discussions.</p>
                <a href="register_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> Start! its Free</a>
                <a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
                
                </div>
            </div>
        </div>
        
        <!--cards-->
        <div class="container">
            <div class="row mb-3">
                
                <!--col-1 started-->
                <div class="col md-4">
                    
                    <div class="card" style="width: 18rem;">
                    <div class="card-body">
                    <h5 class="card-title">Java Programming</h5>
                    <p class="card-text">Java programming is a high-level, versatile, and widely used programming language that was initially developed by Sun Microsystems (now owned by Oracle Corporation) in the mid-1990s.
                    </p>
                    </div>
                    </div>
                    
                </div>
                <!--col-1 ended-->
                
                <!--col-2 started-->
                <div class="col md-4">
                    
                    <div class="card" style="width: 18rem;">
                    <div class="card-body">
                    <h5 class="card-title">Python  Programming</h5>
                    <p class="card-text">Python is a versatile, high-level, and interpreted programming language known for its simplicity, readability, and extensive standard library. It was created by Guido van Rossum and was first released in 1991.</p>
                    </div>
                    </div>
                    
                 </div>
                 <!--col-2 ended-->
                 
                 <!--col-3 started-->
                 <div class="col md-4">
                    
                    <div class="card" style="width: 18rem;">
                    <div class="card-body">
                    <h5 class="card-title">Database Management</h5>
                    <p class="card-text">A Database Management System (DBMS) is a software application or system. Database management system facilitates the creation, organization, management, and retrieval of data from a database.
                    </p>
                    </div>
                    </div>
                    
                  </div>
                  <!--col-3 ended-->

            </div>
            
            </div>
        </div>
        
        <!--javascripts-->
        <script
        src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>

       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
    
    </body>
</html>
