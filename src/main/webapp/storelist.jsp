<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, kr.qtorder.model.FoodTruckVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>QT Order, Store Page</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
        
        <style>
        	.btn-custom{
        		border-color: #FA823C;
        		font-weight: bold;
        	}
        
        </style>
        
    </head>
    <body style="background-color: #FA823C;">
    
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
          
                            <c:forEach var="ft" items="${selectFoodTruck}">
	                            <div class="col-xl-5 col-lg-6 col-md-8 col-sm-11 mt-4">
	                                <div class="card text-center h-100">
	                                    <div class="card-body d-flex flex-column">
	                                        <div>
	                                            <div class="h3">${ft.ft_name}</div>
	                                            <p class="text-muted mb-4">${ft.ft_info}</p>
	                                        </div>
	                                        <div class="icons-org-create align-items-center mx-auto mt-auto">
	                                            <i class="icon-users" data-feather="users"></i>
	                                            
	                                        </div>
	                                    </div>
	                                    <div class="card-footer bg-transparent px-5">
	                                        <div class="small text-center"><a class="btn btn-block btn-primary btn-custom" href="multi-tenant-create.html" style="background-color: #FA823C;">메뉴 보기</a></div>
	                                    </div>
	                                </div>
	                            </div>
                            </c:forEach>
                        
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="footer-admin mt-auto footer-dark">
                    <div class="container-xl px-4">
                        <div class="row">
                            <div class="col-md-6 small">Copyright &copy; Your Website 2021</div>
                            <div class="col-md-6 text-md-end small">
                                <a href="#!">Privacy Policy</a>
                                &middot;
                                <a href="#!">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>
