<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentCareerInfo.aspx.cs" Inherits="OrangeBoard.StudentCareerInfo" %>
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
      <link rel="stylesheet" href="css/style.css">
      <style>
         body {
         background-image: url("blue1.png");
         -moz-background-size : cover;
         }
         #form
         {
         background-color:White;
         }
         #form div
         {
         margin-top:10px;
         }
         #form input, textarea, button
         {
         border:2px solid #9ECEDB;
         padding:3px 5px;
         }
         #form label
         {
         font-weight:bold;
         font-size:12px;
         color:#184552;
         }
         .required
         {
         color:#dd6666;
         }
         #form button
         {
         background-color: #9ECEDB;
         color: #184552;
         cursor:pointer;
         }
         #form button:hover
         {
         background-color: blue;
         }
         #form div
         {
         margin-top:10px;
         }
         #form input, textarea, button
         {
         border:2px solid #9ECEDB;
         padding:3px 5px;
         }
         #form label
         {
         font-weight:bold;
         font-size:12px;
         color:#184552;
         }
         #form
         {
         width:500px;
         margin:auto;
         font-family: sans-serif;
         box-shadow: 5px 5px 5px #888888;
         padding:20px;
         border:4px solid #27748A;
         }
         legend
         {
         display:inline;
         font-size: 40px;
         }
         fieldset
         {
         display:inline;
         border:3px solid #283be2;
         }
         #form h2
         {
         color:#27748A;
         font-size:35px;
         margin:0;
         }
         .field_set{
         padding: 3em;
         border-color: #0066FF;
         border-style: solid;
         }
         #button{
         text-align:center;
         }
         #button1{
         text-align:center;
         }
         .Button1{
         padding: 10px 30px 10px 30px;
         background: #66C1E4;
         border: none;
         color: #FFF;
         box-shadow: 1px 1px 1px #4C6E91;
         -webkit-box-shadow: 1px 1px 1px #4C6E91;
         -moz-box-shadow: 1px 1px 1px #4C6E91;
         text-shadow: 1px 1px 1px #5079A3;
         text-align:center;
         }
         .Button1:hover{
         background: #3EB1DD;
         }   
         .resizedTextbox {width: 100px; }
         #form p
         {
         font-size:15px;
         color:#222222;
         }
         @media only screen and ( max-width : 600px) 
         {
         #form {
         width: 350px;
         margin: auto;
         font-family: sans-serif;
         box-shadow: 5px 5px 5px #888888;
         padding: 20px;
         border: 4px solid #27748A;
         }
         #button {
         width: 350px;
         }
         }
         .auto-style1 {
         font-size: 30px;
         color: #0066FF;
         }
      </style>
   </head>
   <body>
      <form id="form2" runat="server">
         <header id="home">
            <nav id="nav-wrap">
               <a class="mobile-btn" href="#nav-wrap" title="Show navigation">Show navigation</a>
               <a class="mobile-btn" href="#" title="Hide navigation">Hide navigation</a>
               <ul id="nav" class="nav">
                  <li> <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/homepage.aspx">Home</asp:HyperLink></li>
                  
                  <li id="hide" runat="server">  <a class="smoothscroll" href="StudentCareerInfo.aspx">Career Services form</a></li>
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
            <center>
               <legend class="auto-style1">Education</legend>
            </center>
            <br />
            <hr />
            <div class="row work">
               <div class="five columns header-col">
                  <h1>Highest degree Earned:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="degree" Width="295px"/>
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Major:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="major" Width="295px"/>
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Programming Skills:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="programming" name='zip' placeholder='Programming skills' Width="295px" />
                     </div>
                  </div>
               </div>
            </div>
            <center>
               <legend class="auto-style1"> Work Experience</legend>
            </center>
            <br />
            <hr />
            <div id="jobdiv" class="row work" runat="server">
               <div class="five columns header-col">
                  <h1>Company:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="Company"  Width="295px" />
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Job Title:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="jobTitle" Width="295px" />
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Number of Years:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="Exyears" Width="295px" />
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Responsibilities:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox ID="jobResponsibility" runat="server"  style="height:100px"  Width="295px"  />
                     </div>
                       <div class="twelve columns">
                    <asp:Button ID="WorkAdd" CssClass="Button1" runat="server"  Text="Add" Width="117px" OnClick="WorkAdd_Click"    />
                </div>
                  </div>
               </div>
                
            </div>
            <center>
               <legend class="auto-style1">Academic experience</legend>
            </center>
            <br />
            <hr />
            <div class="row work">
               <div class="five columns header-col">
                  <h1>Project Title:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="projectTitle"   Width="295px" />
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Project Completion Date:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="projCompletionDate"  Width="295px" />
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Technologies:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox runat="server" ID="technology"   Width="295px" />
                     </div>
                  </div>
               </div>
               <div class="five columns header-col">
                  <h1>Your Responsibilities in Project:</h1>
               </div>
               <div class="seven columns main-col">
                  <div class="row item">
                     <div class="twelve columns">
                        <asp:TextBox ID="Projresponsibiity" runat="server"  style="height:100px"  Width="295px"  />
                     </div>
                      <div class="twelve columns">
                          <asp:Button ID="Button1" CssClass="Button1" runat="server"  Text="Add" Width="117px" OnClick="ProjectAdd_Click"    />
                      </div>
                  </div>
               </div>

                <center>
                    </center>

            </div>
             <center><asp:Button ID="careerInfo" CssClass="Button1" runat="server"  Text="Save" Width="117px" OnClick="Button1_Click"    /></center>
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
         <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
         <script  src="js/index.js"></script>
         <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
         <script type="text/javascript" src="js/materialize.min.js"></script>
      </form>
   </body>
</html>