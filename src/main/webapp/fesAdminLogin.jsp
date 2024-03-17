<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>페스티벌 관리자 로그인</title>
  <link href="css/styles.css" rel="stylesheet" />
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
  <script data-search-pseudo-elements defer
    src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
    crossorigin="anonymous"></script>

  <style>
    .bg-color {
      background-color: #FA823C;
      border-color: #FA823C;
    }

    .text-col {
      color: black !important;
    }
  </style>

</head>

<body class="bg-color">
  <div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
      <main>
        <div class="container-xl px-4">
          <div class="row justify-content-center">
            <div class="col-lg-5">
              <!-- Basic login form-->
              <div class="card shadow-lg border-0 rounded-lg mt-5">
                <div class="card-header justify-content-center">
                  <h3 class="fw-light my-4">행사 관리자 로그인</h3>
                </div>
                <div class="card-body">
                  <!-- Login form-->
                  <form action="fesAdminLogin.do" method="post">
                    <!-- Form Group (email address)-->
                    <div class="mb-3">
                      <label class="small mb-1">아이디</label>
                      <input class="form-control" id="admin_id" name="admin_id" type="text" placeholder="아이디를 입력하세요" />
                    </div>
                    <!-- Form Group (password)-->
                    <div class="mb-3">
                      <label class="small mb-1">비밀번호</label>
                      <input class="form-control" id="admin_pw" name="admin_pw" type="password"
                        placeholder="비밀번호를 입력하세요" />
                    </div>
                    <!-- Form Group (login box)-->
                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                      <!-- <a class="small text-col" href="auth-password-basic.html">비밀번호 찾기</a> -->
                      <button id="admin_login" type="submit" class="btn btn-primary bg-color">로그인</button>
                    </div>
                  </form>
                </div>
                <div class="card-footer text-center">
                  <div class="small"><a class="text-col" href="GofesAdminJoin.do">회원가입</a></div>
                </div>
              </div>
            </div>
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
  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>

</body>

</html>
