<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="c1.aspx.cs" Inherits="OrangeBoard.c1" %>
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
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
                  <li> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/homepage.aspx">Home</asp:HyperLink></li>
                  
                <%--  <li><a class="smoothscroll" href="#resume">Lessons</a></li>--%>
                  <li> <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/homepage.aspx">Logout</asp:HyperLink></li>
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
            <div class="row work">
               <div class="three columns header-col">
                  <h1><span>Courses</span></h1>
                  
               </div>
               <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <h3 id="coursetitle" runat="server"></h3>
                        <div class="well well-lg">
                           <p>
                             <i>
                             <b>
                              Location :-</b> <div id="courselocation" runat="server">  </div> <br />
                               </i>
                              <i>
                              <b>Day of the week :-</b> <div id="courseday" runat="server">  </div> <br />
                              <b>Timings :-</b> <div id="coursetiming" runat="server"> </div> 
                              </i>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
                </div>

      
             


             <div class="row work">

               <div class="three columns header-col">
                  <h3>Send Message</h3>
               </div>
               <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                         <asp:TextBox ID="c1txtarea" runat="server"></asp:TextBox>
                        
                        <asp:Button ID="notifybtnc1" runat="server" Text="Notify" OnClick="sendmailadd" />
                     </div>
                  </div>
               </div>
               
                 </div>
             <div class="row work">
               <div class="three columns header-col">
                  <h3>View Discussions</h3>
               </div>
               <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:Button ID="discc3btn" runat="server" Text="Discussions" OnClick="discc3btn_Click" />
                     </div>
                  </div>
               </div>
               

                 </div>
             <div class="row work">
                <div class="three columns header-col">
                  <h3>Upload Content</h3>
               </div>

                <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">

                          
                  
                     <div class="col-md-6">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                     </div>
                      
                              <div class="col-md-6">
                     <asp:Button ID="Button1" runat="server" OnClick="c1uploadbtn" Text="Upload" />
                          </div>
                      
                      <!--added a label here -->
                              <div class="col-md-6">
                      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                  </div>
                         
                         </div>
                  </div>

                </div>
                 </div>
             <div class="row work">

                 <div class="three columns header-col">
                  <h3>Upload Assignment Questions</h3>
               </div>

                <div class="nine columns main-col">
                  <div class="row item">
                     <div class="twelve columns">

                          
                  
                     <div class="col-md-6">
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                     </div>
                      
                              <div class="col-md-6">
                     <asp:Button ID="Button2" runat="server" OnClick="c1uploadbtn" Text="Upload" />
                          </div>
                      
                      <!--added a label here -->
                              <div class="col-md-6">
                      <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                                  </div>
                         </div>
                         
                  </div>

                </div>

               
                
           

                 <div class="three columns header-col">
                  <h3> </h3>
               </div>
                  

                   <!-- No changes till here-->

                   <div class="nine columns main-col">
                           <div class="row item">
                              <div class="twelve columns">
                                  
                               <center>
                               <asp:GridView ID="GridView1" runat="server" Width="80%" AutoGenerateColumns="false" EmptyDataText = "">
                               
                                   <Columns>
                                 <asp:BoundField DataField="Text" HeaderText="File Name" />
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="LinkButton1" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                        <!--added this new delete button with different id-->
                                       <asp:LinkButton ID = "LinkButton2delete" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                              </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                       <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                       <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                       <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                       <RowStyle BackColor="#EFF3FB" />
                                       <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                       <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                       <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                       <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                       <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           
                           </asp:GridView>
                           </center>
                           </div>
                           </div>
                    </div>
                   </div>
                   
                   <!-- change ended-->

                     
               
                <!--Assignments download section added  -->
                <div class="row work">
                <div class="three columns header-col">
                  <h3>Assignments submitted</h3>
               </div>
             
             <div class="nine columns main-col">
                           <div class="row item">
                              <div class="twelve columns">
                                   <asp:Button ID="instructorassignmentbtn" runat="server" Text="View Assignment"  OnClick="viewuploadedassignment" />



                                  </div>
                               <div class="twelve columns">
                                   <center>
                                   <asp:GridView ID="GridViewinstructorassignment" Width="80%" runat="server" AutoGenerateColumns="False" EmptyDataText = "No files uploaded" CellPadding="4" ForeColor="#333333" GridLines="None">
                             
                                       <AlternatingRowStyle BackColor="White" />
                             
                                   <Columns>
                                 <asp:BoundField DataField="Text" HeaderText="File Name" />
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID="lnkDownloadassignmentinstructor" Text = "Download" CommandArgument = '<%# Eval("Value") %>' runat="server" OnClick = "DownloadFile"></asp:LinkButton>
                                    </ItemTemplate>
                                 </asp:TemplateField>
                                 <asp:TemplateField>
                                    <ItemTemplate>
                                       <asp:LinkButton ID = "lnkDeleteassignmentinstructor" Text = "Delete" CommandArgument = '<%# Eval("Value") %>' runat = "server" OnClick = "DeleteFile" />
                                    </ItemTemplate>
                                 </asp:TemplateField>
                              </Columns>
                           
                                       <EditRowStyle BackColor="#2461BF" />
                                       <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                       <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                       <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                       <RowStyle BackColor="#EFF3FB" />
                                       <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                       <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                       <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                       <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                       <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           
                           </asp:GridView>
                                       </center>

                               </div>
                 </div>
                 </div>
             
             
            

                <!-- changes ended-->



            </div>
         </section>
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