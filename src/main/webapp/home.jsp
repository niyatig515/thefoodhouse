<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Food House</title>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
     <link href="style.css" rel="stylesheet">
     <style type="text/css">
     
     
     
     </style>
</head>
<body class="homebody">
   <%     
 String username =(String) session.getAttribute("username"); 
%>
    <div class="col-md-3  navbar bg-light">
        <h2 class="text-center">The Food House</h2>
        <div class="address-section">
            <hr>
            <p>789 Masala Market, Flavor Street, Tastyville, Bhopal, Madhya Pradesh, 462001</p>
            <hr>
        </div>
        <div class="sidebar ">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="home.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#menu" data-toggle="collapse">Menu</a>
                <div id="menu" class="collapse">
                    <ul class="nav flex-column ml-3">
                        <li class="nav-item">
                            <a class="nav-link" href="appetizer.jsp">Appetizers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="main.jsp">Mains</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Dessert.jsp">Desserts</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="beverages.jsp">Beverages</a>
                        </li>
                    </ul>
                </div>
                <li class="nav-item">
                <a class="nav-link active" href="mycart.jsp">My Cart</a>
            </li>
                
                <li class="nav-item">
                <a class="nav-link active" href="login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="signup.jsp">Signup</a>
            </li>
           <li class="nav-item">
                <a class="nav-link" href="#contact">Contact Us</a>
            </li>
            <li class="nav-item">
                <a class="nav-link active" href="logout">Logout</a>
            </li>
        </ul>
        </div>
    </div>
    <div class="col-md-9 homecontent">
        <div class="row">
            <div class="img1 col-md-6 mb-3">
                <img src="https://i.pinimg.com/474x/9a/87/b3/9a87b30e64d3b1f306da2a3294d6eb2e.jpg" class="img-fluid " alt="Sample Image">
            </div>
            <div class="img2 col-md-6 mb-3">
                <img src="https://i.pinimg.com/564x/a5/68/60/a56860d41d8dd6a75d51a0211e33a12f.jpg" class="img-fluid" alt="Sample Image">
            </div>
            <div class="img3 col-md-6 mb-3">
                <img src="https://i.pinimg.com/474x/71/2a/e6/712ae6bff2a820a5282256d739be6ed9.jpg" class="img-fluid" alt="Sample Image">
            </div>
            <div class="img4 col-md-6 mb-3">
                <img src="https://i.pinimg.com/564x/33/9b/b9/339bb9d3758a6078c7f8a7db996b0854.jpg" class="img-fluid" alt="Sample Image">
            </div>
            <div class="img5 col-md-6 mb-3">
                <img src="https://i.pinimg.com/564x/98/6e/80/986e8020d901fe1c313e9460495ec5c3.jpg" class="img-fluid" alt="Sample Image">
            </div>
            <div class="img6 col-md-6 mb-3">
                <img src="https://i.pinimg.com/564x/6b/51/54/6b5154bb2020840578d74c14083930e4.jpg" class="img-fluid" alt="Sample Image">
            </div>
            
        </div>
        <div class="inst">
        <h1 class="stylish" > The Food House</h1> 
        <p class="stylish">Where every dish tells a story, and every bite is a journey.</p>
        <div class="tab">
            <table class="menu-section">
               <tr>
                  <td class="text-section" >
                      <p>Indulge in our diverse menu featuring a tantalizing array of appetizers,<br/> hearty mains, irresistible desserts, and refreshing beverages</p>
                      <div class="menu-links">
                          <a href="appetizer.jsp">Appetizers</a>
                          <a href="main.jsp">Hearty Mains</a>
                          <a href="Dessert.jsp">Irresistible Desserts</a>
                          <a href="beverages.jsp">Refreshing Beverages</a>
                      </div>
                  </td>
                  <td class="img7" colspan="2">
                      <img src="https://i.pinimg.com/474x/0b/82/fc/0b82fc4224f28bcfc56a2b28bb464717.jpg" class="img-fluid" alt="Sample Image">
                  </td>
                </tr>
            </table>
        </div>
        </div>
        <div class="contact">
        <h1 align="center">Contact Form</h1>
    <hr size="3" width="70%" align="center" color="black">
    <p align="center"><b>Please fill this form to contact us</b></p>
    <form action="contact.jsp">
        <table align="center" width="500px" cellspacing="10">
            <tr>
            <td><b>First Name:</b></td>
            <td><b>Last Name:</b></td>
            </tr>
            <tr cellspacing="0">
                <td>
                    <input type="text" name="fname" placeholder="Enter your first name" name="fname" size="35% ">
                </td>
                <td><input type="text" name="lname" placeholder="Enter your last name" name=lname size="40%"></td>
            </tr>
            <tr>
                <td colspan="2"><b>Email:</b></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="email" name="conemail" placeholder="Enter your email" name="email" size="84%"></td> 
                </tr>
                <tr>
                    <td colspan="2"><b>Mobile:</b></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="tel" name="mobile" placeholder="Enter your mobile no." name="mobile" size="85%"></td> 
                </tr>
                <tr>
                    <td colspan="2"><b>Message:</b></td>
                </tr>
                <tr>
                    <td colspan="2"><textarea name="message" name="message" placeholder="Enter your message"size="107%" rows="8" cols="88"></textarea></td> 
                </tr><br/>
                <tr align="center">
                    <td><input type="submit" value="Submit"></td>
                    <td><input type="reset" value="Reset"></td>
                </tr>
        </table>
    </form>
    </div>
    <footer class="footer bg-white text-dark py-3 foot">
        <div class="foot-section">
            <div class="contactfoot">
                <div class="col-md-6 ">
                    <h5>Contact Us</h5>
                    <p>123 Spice Market, Flavor Street, Tastyville, Bhopal, Madhya Pradesh, 462001</p>
                    <p>Email: info@thefoodhouse.com</p>
                    <p>Phone: +91 1234567890</p>
                </div>
                <div class="col-md-6 follow">
                    <h5>Follow Us</h5>
                    <ul class="list-unstyled">
                        <li><a href="#">Facebook</a></li>
                        <li><a href="#">Twitter</a></li>
                        <li><a href="#">Instagram</a></li>
                       
                    </ul>
                    <br/>
                     <p>Developed By<a href="https://www.linkedin.com/in/niyati-gupta-0881b9250/"> Niyati Gupta</a></p>
                </div>
            </div>
            <hr>
            <div class="text-center">
                <p>&copy; 2024 The Food House. All rights reserved.</p>
                
            </div>
            <hr>
        </div>
    </footer>
</div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>


