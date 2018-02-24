

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PostComment.aspx.cs" Inherits="OrangeBoard.PostComment" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
      <!--- Basic Page Needs
         ================================================== -->
      <meta charset="utf-8">
      <title>Orange Board</title>
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- Mobile Specific Metas
         ================================================== -->
      <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
         crossorigin="anonymous">
      <!-- CSS
         ================================================== -->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link rel="stylesheet" href="css/default.css">
      <link rel="stylesheet" href="css/layout.css">
      <link rel="stylesheet" href="css/media-queries.css">
      <link rel="stylesheet" href="css/magnific-popup.css">
      <!-- Script
         ================================================== -->
      <script src="js/modernizr.js"></script>
      <!-- Favicons
         ================================================== -->
      <link rel="shortcut icon" href="favicon.png">
   </head>
   <body>
      <form id="form2" runat="server">
         <header id="home">
            <nav id="nav-wrap">
               <a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show navigation</a>
               <a class="mobile-btn" href="#" title="Hide navigation">Hide navigation</a>
               <ul id="nav" class="nav">
                  <li class="current"><a class="smoothscroll" href="#home">Home</a></li>
                  <li><a class="smoothscroll" href="#info">About</a></li>
                <%--  <li><a class="smoothscroll" href="#project">Lessons</a></li>
                  <li><a class="smoothscroll" href="#project">Lessons</a></li>
                  <li><a class="smoothscroll" href="#project">Lessons</a></li>--%>
               </ul>
               <!-- end #nav -->
            </nav>
            <!-- end #nav-wrap -->
            <div class="row banner">
               <div class="banner-text">
                  <h1>
                     Orange Board
                     <span class="wrapper"></span>
                  </h1>
                  <hr />
               </div>
            </div>
            <p class="scrolldown">
               <a class="smoothscroll" href="#about"><i class="icon-down-circle"></i></a>
            </p>
            <hr/>
         </header>
         <!-- Header End -->
         <!-- Info Section
            ================================================== -->
         <section id="resume">
             <div class="container col-md-10">
                 
                  <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="false" Width="100%" GridLines="None">
                     <Fields>
                        <asp:TemplateField ShowHeader="false">
                           <ItemTemplate>
                              <tr>
                                 <div>
                                    <h2>
                                       <asp:Label ID="lblBlogPostTitle" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                                    </h2>
                                    <div>
                                       <span>
                                          <asp:Label ID="lblAuthor" runat="server" Text='<%#Eval("Author") %>'></asp:Label>
                                       </span>
                                       <span>
                                          <asp:Label ID="lblBlogDate" runat="server" Text='<%#Eval("BlogDate") %>'></asp:Label>
                                       </span>
                                    </div>
                                    <div style="text-align: justify;">
                                       <p>
                                          <asp:Label ID="lblMessage" runat="server" Text='<%#Eval("Content") %>'></asp:Label>
                                       </p>
                                    </div>
                                 </div>
                              </tr>
                           </ItemTemplate>
                        </asp:TemplateField>
                     </Fields>
                  </asp:DetailsView>
               
               
                  <hr />
                  comments:
                  <br />
                  <asp:GridView ID="GridViewcomment" runat="server" AutoGenerateColumns="false" ShowHeader="false" GridLines="None" Width="100%" CellSpacing="10">
                     <Columns>
                        <asp:TemplateField>
                           <ItemTemplate>
                              <tr>
                                 <td>
                                    <div>
                                       <asp:Label ID="Label1" runat="server" Text='<%#Eval("Name") %>' Font-Bold="true" Font-Italic="false" Font-Size="Large"></asp:Label>
                                       <asp:Label ID="LabelCommentDate" runat="server" Text='<%# Eval("Date") %>' Font-Size="Smaller"></asp:Label>
                                    </div>
                                    <div>
                                       <p>
                                          <asp:Label ID="Lblcomment" runat="server" Text='<%#Eval("Comment") %>'></asp:Label>
                                       </p>
                                    </div>
                                 </td>
                              </tr>
                           </ItemTemplate>
                        </asp:TemplateField>
                     </Columns>
                  </asp:GridView>
                  <asp:Label ID="LabelNoComment" runat="server" Text="No comments yet." Visible="false"></asp:Label>
               
               <div id="comment_form">
                  <h3>Post a comment</h3>
                  <label>Name</label>
                  <asp:TextBox ID="txbxcommentauthor" runat="server" MaxLength="30"></asp:TextBox>
                  <br />
                  <label>Comment</label>
                  <asp:TextBox ID="txbxcomment" runat="server" TextMode="MultiLine"></asp:TextBox>
                  <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
               </div>
           

             
             </div>
         </section>
         <!-- Resume Section End-->
         <!-- project Section
            ================================================== -->
         <section id="About">
         </section>
         <!-- footer
            ================================================== -->
         <footer>
            <div class="row">
               <div class="col-md-3">
                  <h5 style="color:white">Syracuse University</h5>
               </div>
               <div class="col-md-3" >
                  <h5 style="color:white">OrangeBoard@gmail.com</h5>
               </div>
               <div class="col-md-3">
                  <h5 style="color:white">Phone: +1.315.443.1870</h5>
               </div>
               <div class="col-md-3">
                  <h5 style="color:white">Syracuse ,NY</h5>
               </div>
            </div>
            <div class="row">
               <div class="twelve columns">
                  <ul class="social-links">
                     <li><a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                     <li><a href="https://twitter.com/"><i class="fa fa-twitter"></i></a></li>
                  </ul>
               </div>
               <div id="go-top"><a class="smoothscroll" title="Back to Top" href="#home"><i class="icon-up-open"></i></a></div>
            </div>
         </footer>
         <!-- Footer End-->
         <script type="text/javascript"></script>
         <!-- Java Script
            ================================================== -->
         <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
         <script>
             window.jQuery || document.write('<script src="js/jquery-1.10.2.min.js"><\/script>')
         </script>
         <script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>
         <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/1.0.2/Chart.js"></script>
         <script src="js/jquery.flexslider.js"></script>
         <script src="js/waypoints.js"></script>
         <script src="js/jquery.fittext.js"></script>
         <script src="js/magnific-popup.js"></script>
         <script src="js/init.js"></script>
         <script src="js/doughnut.js"></script>
         <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
         <script type="text/javascript" src="js/materialize.min.js"></script>
      </form>
   </body>
</html>