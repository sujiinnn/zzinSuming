<%@ page contentType="text/html" pageEncoding="utf-8"%>
<%@ page import="deu.cse.suming.Dto.Album"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.io.StringWriter" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.HashSet"%>
<%@ page import="java.util.Set"%>
<%
    List<Album> Album = (List<Album>) session.getAttribute("messages");
    Iterator<Album> iter = null;
    if (Album != null) {
        iter = Album.iterator();
    }
%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>ì¸ì</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="images/favicon.png">

        <link rel="stylesheet" href="css/style.css">

        <!--[if lt IE 9]>
                <script src="//html5shiv.googlecode.com/svn/trunk/html5.js"></script>
                <script>window.html5 || document.write('<script src="js/vendor/html5shiv.js"><\/script>')</script>
            <![endif]-->
    </head>

    <body>

        <!-- PRELOADER -->
        <div id="preloader">
            <div class="preloader-area">
                <div class="preloader-box">
                    <div class="preloader"></div>
                </div>
            </div>
        </div>


        <section class="header-top-section-matching">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="header-top-content">
                            <ul class="nav nav-pills navbar-brand">
                                <li><a href="index.html"><image src="images/logo.png" width="100" height="50" alt=""></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="titie-section wow fadeInDown animated ">
                        <h1>ë¹ì ì ì´ìíì ê³ ë¥´ì¸ì.</h1>
                    </div>
                </div>
            </div>

            <div class="row featured isotope">
                <div class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
                    <div class="product-item">
                        <img src="images/member2.png" class="img-responsive" width="255" height="322" alt="">

                        <div class="product-hover">
                            <div class="product-meta">
                                <a href="chat.html">ì±ííê¸°</a>
                            </div>
                        </div>
                        <div class="product-title">
                            <!--<a href="#">-->
                            <h3>name</h3>
                            <%
                                if (iter != null) {
                                    while (iter.hasNext()) {

                                    }
                                }
                            %>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
                    <div class="product-item">
                        <img src="images/member2.png" class="img-responsive" width="255" height="322" alt="">

                        <div class="product-hover">
                            <div class="product-meta">
                                <a href="chat.html">ì±ííê¸°</a>
                            </div>
                        </div>
                        <div class="product-title">
                            <h3>name</h3>

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
                    <div class="product-item">
                        <img src="images/member2.png" class="img-responsive" width="255" height="322" alt="">

                        <div class="product-hover">
                            <div class="product-meta">
                                <a href="chat.html">ì±ííê¸°</a>
                            </div>
                        </div>
                        <div class="product-title">
                            <h3>name</h3>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12 cat-3 featured-items isotope-item">
                    <div class="product-item">
                        <img src="images/member2.png" class="img-responsive" width="255" height="322" alt="">

                        <div class="product-hover">
                            <div class="product-meta">
                                <a href="chat.html">ì±ííê¸°</a>
                            </div>
                        </div>
                        <div class="product-title">
                            <h3>name</h3>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- JQUERY -->
        <script src="js/vendor/jquery-1.11.2.min.js"></script>
        <script src="js/vendor/bootstrap.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>