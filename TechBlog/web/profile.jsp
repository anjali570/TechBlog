
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%--<%@page import="java.awt.PageAttributes.MediaType.C"%>--%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User)session.getAttribute("currentUser");
    if(user == null)
    {
      response.sendRedirect("login_page.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 68% 87%, 34% 100%, 0 86%, 0 0);            
            }
            
            body{
                background: url(img/bg12.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

        </style>

    </head>
    <body>
        
                <!--navbar-start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-cube"></span> Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

       <div class="collapse navbar-collapse" id="navbarSupportedContent">
       <ul class="navbar-nav mr-auto">
       <li class="nav-item active">
           <a class="nav-link" href="#"><span class="fa fa-bookmark"></span> Home <span class="sr-only">(current)</span></a>
       </li>
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <span class="fa fa-check-circle"></span> Categories
        </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Java programming Language</a>
          <a class="dropdown-item" href="#">Python programming Language</a>
          <a class="dropdown-item" href="#">Database</a>
          <a class="dropdown-item" href="#">C++ programming Language</a>
        </div>

        </li>
         
         <li class="nav-item">
             <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-commenting"></span> Do Post</a>
         </li>
         
       </ul>
           
           <ul class="navbar-nav mr-right">
               
              <li class="nav-item">
                  <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span> <%= user.getName() %> </a>
              </li>
               
               
              <li class="nav-item">
                  <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Log Out</a>
              </li>
               
           </ul>
           
       </div>
       </nav>
       <!--navbar-end-->
       
       
                <%
                    Message m = (Message)session.getAttribute("msg");
                    if(m != null)
                    {
                       %>
                                   
                        <div class="alert <%= m.getCssClass() %>" role="alert">
                        <%= m.getContent()%>
                        </div>
                                  
                                   
                        <%
                        session.removeAttribute("msg");
                     }
                 %>

       
                 <!--start main body of the page-->
                 
                 <main>
                     <div class="container">
                         <div class="row mt-4">
                             <!--1st col-->
                             <div class="col-md-4">
                                 
                                 <!--all categories-->
                                 <div class="list-group">
                                     <a href="#" onclick="getPosts(0, this)" class="c-link list-group-item list-group-item-action active">
                                    All Posts
                                 </a>
                                     
                                     <!--categories-->
                                     <%
                                         PostDao d = new PostDao(ConnectionProvider.getConnection());
                                         ArrayList<Category> list1 = d.getAllCategories();
                                         for(Category cc : list1)
                                         {
                                            %>
                                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class="c-link list-group-item list-group-item-action"><%= cc.getName() %></a>
                                            <%
                                         }
                                     %>
                                     
                                 </div>
                             </div>
                             
                             <!--2nd col-->
                             <div class="col-md-8">
                                 
                                 <!--posts-->
                                 <div class="container text-center" id="loader">
                                     <i class="fa fa-refresh fa-3x fa-spin"></i>
                                     <h3 class="mt-2">Loading. . .</h3>
                                 </div>
                                 
                                 <div class="container-fluid" id="post-container">
                                     
                                 </div>
                                 
                                 
                             </div>
                         </div>
                     </div>
                 </main>
                 
                 
                 <!--end main body of the page-->
                 
                 
       
       <!--profile modal start-->
       <!-- Modal -->
      <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
      <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
          <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <!--<img src="pics/default.png" class="img-fluid" style="border-radius:50%; max-width: 150px">-->
              <img src="pics/<%=user.getProfile()%>" class="img-fluid" style="border-radius:50%; max-width: 150px">
              <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
              
              
              <!--details start-->
              <div id="profile-details">
              <table class="table">
             <tbody>
             <tr>
             <th scope="row"> ID :</th>
             <td><%= user.getId()%></td>
             </tr>
             <tr>
             <th scope="row"> Email :</th>
             <td><%= user.getEmail() %></td>
             </tr>
             <tr>
             <th scope="row"> Gender :</th>
             <td><%= user.getGender() %></td>
             </tr>
             <tr>
             <th scope="row"> Status :</th>
             <td><%= user.getAbout() %></td>
             </tr>
             <tr>
             <th scope="row"> Registered on :</th>
             <td><%= user.getDateTime().toString() %></td>
             </tr>
             </tbody>
             </table>
             </div>
              <!--deatils end-->
              
              <!--profile-edit-->
              <div id="profile-edit" style="display: none;">
                  <h2 class="mt-2">Please Edit Carefully</h2>
                  <form action="Editservlet" method="post" enctype="multipart/form-data">
                      <table class="table">
                          <tr>
                              <td> ID:</td>
                              <td><%= user.getId() %></td>
                          </tr>
                          <tr>
                              <td> Email:</td>
                              <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                          </tr>
                          <tr>
                              <td> Name:</td>
                              <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"></td>
                          </tr>
                          <tr>
                              <td> Password:</td>
                              <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>"></td>
                          </tr>
                          <tr>
                              <td> Gender:</td>
                              <td><%= user.getGender().toUpperCase() %></td>
                          </tr>
                          <tr>
                              <td> About:</td>
                              <td>
                                  <textarea rows="3" class="form-control" name="user_about"><%= user.getAbout()%></textarea>
                              </td>
                          </tr>
                          <tr>
                              <td>Change profile:</td>
                              <td>
                                  <%--<%= user.getProfile()%>--%>
                                  <input type="file" name="image" class="form-control">
                              </td>
                          </tr>
                      </table>
                              
                              <div class="container">
                                  <button type="submit" class="btn btn-outline-primary">Save</button>
                              </div>
                              
                  </form>
              </div>
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
      </div>
      </div>
      </div>
       <!--profile modal end-->
       
       <!--add post modal-->
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details.</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          <form id="add-post-form" action="AddPostServlet" method="post">
              
              <!--categories-->
              <div class"form-group">
                  <select class="form-control" name="cid">
                  <option selected disabled>---Select Category---</option>
                  
                  <%
                      PostDao postd = new PostDao(ConnectionProvider.getConnection());
                      ArrayList<Category> list = postd.getAllCategories();
                      for(Category c : list)
                      {
                      %>
                      <option value="<%= c.getCid()%>"><%= c.getName() %></option>
                      <%
                      }
                      %>
              </select>
              </div>
              <br>              
              <div class="form-group">
                  <input name="pTitle" type="text" placeholder="Enter post title " class="form-control"/>
              </div>
              
              <div class="form-group">
                  <textarea name="pContent" class="form-control" style="height: 200px" placeholder="Enter your content"></textarea>
              </div>
              
              <div class="form-group">
                  <textarea name="pCode" class="form-control" style="height: 200px" placeholder="Enter your program code (if any)"></textarea>
              </div>
              
              <div class="form-group">
                  <label>Select photo (if any)</label>
                  <br>
                  <input type="file" name="pic">
              </div>
              
              <div class="container text-center">
                  <button type="submit" class="btn btn-outline-primary">Post</button>
              </div>
              
          </form>
          
          
      </div>
    </div>
  </div>
</div>
       <!--add post modal end-->
        
        <!--javascripts-->
        <script
        src="https://code.jquery.com/jquery-3.7.0.min.js"
        integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g="
        crossorigin="anonymous"></script>

       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
       <script src="js/myjs.js" type="text/javascript"></script>
       
       <script>
           $(document).ready(function(){
               
              let editStatus = false;
               
               $('#edit-profile-button').click(function(){
                   
                   if(editStatus === false)
                   {
                       $('#profile-details').hide();
                       $('#profile-edit').show();  
                       editStatus = true;
                       $(this).text("Back");
                   }
                   else
                   {
                       $('#profile-details').show();
                       $('#profile-edit').hide();  
                       editStatus = false;
                       $(this).text("Edit");
                   }
               });
           });
       </script>
       
       <!--now add post js-->
       <script>
           $(document).ready(function(e){
               
               $("#add-post-form").on("submit", function(event){
                   //this code gets called when form is submitted...
                   event.preventDefault();
                   
                   console.log("You have clicked on submit");
                   
                   let form = new FormData(this);
                   
                //now requesting to server
                $.ajax({
                    url: "AddPostServlet",
                    type: 'POST',
                    data: form,
                    success : function(data, textStatus, jqXHR){
                    //success...
                    console.log(data);
                    if(data.trim() === "done")
                    {
                        swal("Good job!", "Your post saved succesfully!", "success");
                    }
                    else
                    {
                        swal("Error!", "Something went wrong...try again!", "error");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown){
                    //error...
                    swal("Error!", "Something went wrong...try again!", "error");
                },
                processData: false,
                contentType: false
                });
               });
               
           });
       </script>
       
       <!--loading post using ajax-->
       <script>
           
           function getPosts(catId, temp){
               $("#loader").show();
               $("#post-container").hide();
               
               $(".c-link").removeClass('active');
               
               $.ajax({
                   url: "load_posts.jsp",
                   data:{cid:catId},
                   success: function(data, textStatus, jqXHR)
                   {
                       console.log(data);
                       $('#loader').hide();
                       $('#post-container').show();
                       $('#post-container').html(data);
                       $(temp).addClass('active');
                   }
               });               
           }
           
           $(document).ready(function(e){
               
               let allPostRef = $('.c-link')[0];
               getPosts(0, allPostRef);
           });
           
       </script>
       
    </body>
</html>
