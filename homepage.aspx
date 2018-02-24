<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="OrangeBoard.homepage" %>
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
      <link rel="stylesheet" href="animate-min.css">

      
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
      <!-- CSS
         ================================================== -->
      <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
      <!--Import materialize.css-->
      <link rel="stylesheet" href="css/default.css">
      <link rel="stylesheet" href="css/layout.css">
      <link rel="stylesheet" href="css/media-queries.css">
      <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@3.5.2/animate.min.css" integrity="sha384-OHBBOqpYHNsIqQy8hL1U+8OXf9hH6QRxi0+EODezv82DfnZoV7qoHAZDwMwEJvSw" crossorigin="anonymous">
      <!-- Script
         <%--================================================== -->--%>
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
                  <li class="current"><a class="smoothscroll" href="DiscussionForum.aspx">Home</a></li>
                  <li><a class="smoothscroll" href="#resume">Login</a></li>
                  <li><a class="smoothscroll" href="#project">Features</a></li>
                   <li><a class="smoothscroll" href="#testimonials">Testimonials</a></li>
                   <li><a class="smoothscroll" href="#contact">Contact Us</a></li>

               </ul>
               <!-- end #nav --> 
            </nav>
            <!-- end #nav-wrap -->
             
            <div class="row banner">
               <div class="banner-text animated">
                  <h1 class="animated infinite bounce">
                     ORANGE BOARD
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
         <section id="resume">
            
               <div class="nine columns header-col">
                  <div class="container">
                     <div class="row animated bounceIn">
                        
                         </div>
                     </div>
                     <div class="row">
                     </div>
                  </div>
               </div>
               <div class="row education">
                  <div class="seven columns header-col">
                      <img src="images/col.jpeg" alt="Image Unavailable due to poor internet Connection" width="700px" height="700px" />
                  </div>
                  <div class="five columns main-col">
                     <div class="row item">
                        <div class="twelve columns">
                           <div class="form-group">
                              <div class="col-md-6 animated zoomIn">
                                 <asp:Label ID="lbl"  runat="server" Text="SUID:"></asp:Label>
                                  </div>
                                 <div class="col-md-6">
                                    <asp:TextBox ID="txtboxsuid" runat="server"  Width="295px"></asp:TextBox>
                                 </div>
                                 <div class="col-md-6">
                                    <asp:Label ID="Label2" runat="server" Text="Password:"></asp:Label>
                                 </div>
                                 <div class="col-md-6">
                                    <asp:TextBox ID="txtPassword" runat="server" CausesValidation="True"  TextMode="Password" Width="295px"></asp:TextBox>
                                 </div>
                              
                              <div class="form-group">
                                 <div class="col-md-6">
                                    <asp:Button ID="Button1" class="btn btn-default" runat="server" Text="Login" OnClick="Button1_Click" />
                                 </div>
                              </div>
                              
                               <div class="col-md-6">
                                  
                              <asp:Button ID="Button2" class="btn btn-default" runat="server" Text="Register" OnClick="Button2_Click" Width="102px"  />
                           </div>
                               </div>
                        </div>
                     </div>
                  </div>




                    <aside class="four columns footer-widgets">
      <div class="widget widget_contact">
      <div class="container">
      <div class="form-group">
                              
      </aside>



              
         </section>
         <!-- Information Section
            ================================================== -->
         <section id="project">
            <div class="row animated bounceInDown">
               <div class="twelve columns collapsed">
                  <!-- project-wrapper -->
                  <div id="project-wrapper" class="bgrid-quarters s-bgrid-thirds cf">
                     <div class="columns project-item">
                        <div class="item-wrap">
                           <a href="#modal-01" title="">
                              <img class="img-responsive" alt="" src="images/discuss.jpg">
                              <div class="overlay">
                                 <div class="project-item-meta">
                                    <h5 style="color:aqua">Discussion Forum</h5>
                                    
                                 </div>
                              </div>
                              <div class="link-icon"><i class="icon-plus"></i></div>
                           </a>
                        </div>
                     </div>
                     <!-- item end -->
                     <div class="columns project-item">
                        <div class="item-wrap">
                           <a href="#modal-02" title="">
                              <img class="img-responsive" alt="" src="images/complexitychecker.jpeg">
                              <div class="overlay">
                                 <div class="project-item-meta">
                                    <h5 style="color:aqua">Complexity Checker</h5>
                                    <p>Coding Assignment</p>
                                 </div>
                              </div>
                              <div class="link-icon"><i class="icon-plus"></i></div>
                           </a>
                        </div>
                     </div>
                     <!-- item end -->
                     <div class="columns project-item">
                        <div class="item-wrap">
                           <a href="#modal-03" title="">
                              <img class="img-responsive" alt="" src="images/sms.jpg">
                              <div class="overlay">
                                 <div class="project-item-meta">
                                    <h5 style="color:aqua">SMS Notifications</h5>
                                    <p>Career Services</p>
                                 </div>
                              </div>
                              <div class="link-icon"><i class="icon-plus"></i></div>
                           </a>
                        </div>
                     </div>
                     <!-- item end -->
                     <div class="columns project-item">
                        <div class="item-wrap">
                           <a href="#modal-03" title="">
                              <img class="img-responsive" alt="" src="images/plag.jpeg">
                              <div class="overlay">
                                 <div class="project-item-meta">
                                    <h5 style="color:aqua">Plagiarism checker</h5>
                                 </div>
                              </div>
                              <div class="link-icon"><i class="icon-plus"></i></div>
                           </a>
                        </div>
                     </div>
                     <div class="container">
                     </div>
                  </div>
                  <!-- project-wrapper end -->
               </div>
               <!-- twelve columns end -->
               <!-- Modal Popup
                  --------------------------------------------------------------- -->
               <div id="modal-01" class="popup-modal mfp-hide">
                  <div class="description-box">
                     <h4>Discussion Forum</h4>
                     <p>
                        <span>&bull; One stop place for students to get doubts solved</span>
                        <br>
                        <span>&bull; Start discussions about various recent trends in technology</span>
                        <br>
                        
                     </p>
                  </div>
                  <div class="link-box">
                     <a class="popup-modal-dismiss">Close</a>
                  </div>
               </div>
               <!-- modal-01 End -->
               <div id="modal-02" class="popup-modal mfp-hide">
                  <div class="description-box">
                     <h4>Complexity Checker</h4>
                     <p>
                        <span>&bull; Code submitted is measured based on various factors such as number of lines,cylic dependency etc</span>
                        <br>
                        <span>&bull; Analysis obtained are used to better understand the code written .</span>
                        
                     </p>
                  </div>
                  <div class="link-box">
                     
                     <a class="popup-modal-dismiss">Close</a>
                  </div>
               </div>
               <!-- modal-02 End -->
               <div id="modal-03" class="popup-modal mfp-hide">
                  <div class="description-box">
                     <h4>SMS Notifications</h4>
                     <p>
                        <span>&bull; Notifications sent to students based on different job criteria.</span>
                        <br>
                        <span>&bull;SMS notifications make sure students don't miss out on any important events. </span>
                        <br>
                         <span>&bull;ClockWork API is used to send notification</span>
                        <br>

                     </p>
                  </div>
                  <div class="link-box">
                     
                     <a class="popup-modal-dismiss">Close</a>
                  </div>
               </div>
               <!-- modal-03 End -->
               <<!-- modal-03 End -->
               <div id="modal-04" class="popup-modal mfp-hide">
                  <div class="description-box">
                     <h4>Plagiarism checker</h4>
                     <p>
                        <span>&bull;Detects if a copy of the assignment submitted is plagiarized.</span>
                        <br>
                        <span>&bull;Lists out the various sources from where the code is taken</span>
                        
                     </p>
                     <span class="categories"><i class="fa fa-tag"></i>C++</span>
                  </div>
                  <div class="link-box">
                     
                     <a class="popup-modal-dismiss">Close</a>
                  </div>
               </div>
               <!-- modal-04 End -->
            </div>
            <!-- row End -->
         </section>
          <p>
              <br />
          </p>

                <section id="testimonials">
                  <center>  <h3 style="color:aqua">Alumni Testimonials</h3></center>
      <div class="text-container">
          
         <div class="row">
             
            <div class="two columns header-col">

               <h1 ><span></span></h1>

            </div>

            <div class="ten columns flex-container">

               <div class="flexslider">

                  <ul class="slides">

                     <li>
                        <blockquote>
                           <p> The best decision of my life was choosing Syracuse University to do my Graduate Studies.
                           I was able to get the best education available.
                           </p>
                           <cite>Ross</cite>
                        </blockquote>
                     </li> <!-- slide ends -->

                     <li>
                        <blockquote>
                           <p>Taking courses like Software Engineering and OOD has been very helpful for my career
                           </p>
                           <cite>Mark</cite>
                        </blockquote>
                     </li> <!-- slide ends -->
                      <li>
                        <blockquote>
                           <p>Great Place to Study!!!
                           </p>
                           <cite>Steve</cite>
                        </blockquote>
                     </li> <!-- slide ends -->

                  </ul>

               </div> 

            </div> 

         </div> 

       </div>  

   </section> <!-- Testimonials Section End-->








         <section id="About">
         </section>
         <section id="contact">
            <div class="row section-head">
               <div class="two columns header-col">
                  <h1><span>Get In Touch.</span></h1>
               </div>
               <div class="ten columns">
                  <h3 style="color:cyan">Contact Us
                  </h3>
               </div>
            </div>
            <div class="row">
               <div class="eight columns">
                  <!-- form -->
      <form action="" method="post" id="contactForm" name="contactForm">
      <fieldset>
      <div>
      <label for="contactName">Name <span class="required">*</span></label>
      <asp:TextBox ID="contactName" runat="server"></asp:TextBox>
      </div>
      
      <div>
      <label for="contactSubject">Subject</label>
      <asp:TextBox ID="contactSubject" runat="server"></asp:TextBox>
      </div>
      <div>
      <label for="contactMessage">Message <span class="required">*</span></label>
      <asp:TextBox ID="contactMessage" cols="20" rows="15" runat="server"></asp:TextBox>
      </div>
       <div class="row item">
           <div class="col-md-3"></div>
      <div class="col-md-6">
      <asp:Button ID="submitbtn" class="submit" runat="server" OnClick="sendmail" Text="Submit" Width="202px"  />
          </div>
      <span id="image-loader">
      <img alt="" src="images/loader.gif">
      </span>
      </div>
      </fieldset>
      </form> <!-- Form End -->
      <!-- contact-warning -->
      <div id="message-warning"> Error</div>
      <!-- contact-success -->
      <div id="message-success">
      <i class="fa fa-check"></i>Your message was sent, thank you!<br>
      </div>
      </div>
      <aside class="four columns footer-widgets">
      <div class="widget widget_contact">
      <div class="container">
      <a class="twitter-timeline" data-width="400" data-height="500" data-theme="light" href="https://twitter.com/SyracuseU?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor">Syracuse University Tweets</a> 
      <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
      </div>
      </div>
      </aside>
      </div>
      </section>
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