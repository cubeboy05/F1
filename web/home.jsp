
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
        response.sendRedirect("index.html");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Formula One</title>
    <!-- Jquery -->
    <script src="js/jquery-2.2.0.min.js"></script>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css">
    <link type="text/css" rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/bootstrap.min.js"></script>

    <!-- Custom Files -->
    <link type="text/css" rel="stylesheet" href="css/styles.css">
    <script src="js/scripts.js"></script>
</head>
<body>

<!-- Nav Bar -->
<div id="custom-bootstrap-menu" class="navbar navbar-default " role="navigation">
    <div class="container-fluid k-custom-navbar-bg">
        <div class="navbar-header">
            <a class="navbar-brand" href="home.jsp">
                <img id="logo" src="img/ljmu_logo_nav.png">
            </a>
            <button type="button" class="navbar-toggle k-toggle-btn-bg" data-toggle="collapse" data-target=".navbar-menubuilder">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
        </div>
        <div class="collapse navbar-collapse navbar-menubuilder">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="home.jsp">Home</a>
                </li>
                <li><a href="#">Drivers</a>
                </li>
                <li><a href="#">Races</a>
                </li>
                <li><a href="#">LiveStats</a>
                </li>
                <li><a href="admin.jsp">Admin</a>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- End of NavBar -->

<!-- Carousel -->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
        <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="img/caro1.jpg" alt="Chania">
        </div>

        <div class="item">
            <img src="img/caro2.jpg" alt="Chania">
        </div>

        <div class="item">
            <img src="img/caro3.jpg" alt="Flower">
        </div>

        <div class="item">
            <img src="img/caro4.jpg" alt="Flower">
        </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>
<!-- Carousel End -->



<!-- FOOTER
================================================== -->
<footer style="background-color: #1a3278; padding: 20px">
    <div class="container">
        <div class="col-sm-3">
            <p><a href="/"><img src="img/logo_footer.png" alt="Bootstrap to WordPress"></a></p>
        </div><!-- end col -->
        <div class="col-sm-6">
            <nav>
                <ul class="list-unstyled list-inline" >
                    <li><a href="">Home</a></li>
                    <li><a href="">Blog</a></li>
                    <li><a href="">Resources</a></li>
                    <li><a href="">Contact</a></li>
                </ul>
            </nav>
        </div><!-- end col -->
        <div class="col-sm-3">
            <p class="pull-right">&copy; 2016 LJMU Formula One</p>
        </div><!-- end col -->
    </div><!-- container -->
</footer><!-- footer -->

</body>
</html>
