<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, kr.qtorder.model.FoodTruckVO"%>
<%@ page import="java.util.List, kr.qtorder.model.FestivalVO"%>
<%@ page import="java.util.List, kr.qtorder.model.FestivalLocVO"%>
<%@ page import="java.util.List, kr.qtorder.model.FesAddListVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Add FoodTruck</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
  <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
  <script data-search-pseudo-elements defer
    src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js"
    crossorigin="anonymous"></script>

  <style>
    .custom-nav-fixed {
      top: 3.625rem;
    }

    .custom-col-xl-8 {
      flex: 0 0 auto;
    }

    #datatablesSimple {
      width: 100%;
      border-collapse: collapse;
      margin: 0 10px;
      /* 좌우 간격을 조절하는 마진 추가 */
      margin-bottom: 20px;
      /* 표 간의 간격을 조절할 수 있는 마진 추가 */
    }

    #datatablesSimple th,
    #datatablesSimple td {
      padding: 12px;
      /* 셀 내부의 패딩 추가 */
      text-align: left;
    }

    .font-setting {
      font-weight: bold;
      font-size: inherit;
    }

    .margin-top {
      margin-top: 15px;
    }

    .margin-bottom {
      margin-bottom: 15px;
    }

    .content_title {
      font-weight: bold !important;
      color: #FA823C !important;
    }

    .addbtn-color {
      font-weight: bold;
      background-color: black;
      border-color: black;
    }

    .main-bg-color {
      background-color: #FA823C;
    }
  </style>

</head>

<body class="custom-nav-fixed">

  <div id="layoutSidenav">
    <div id="layoutSidenav_content">
      <main>

        <!-- 최상단 헤더 -->
        <header class="page-header page-header-compact page-header-light border-bottom bg-white mb-4">
          <div class="container-xl px-4">
            <div class="page-header-content">
              <div class="row align-items-center justify-content-between pt-3">
                <div class="col-auto mb-3">
                  <h1 class="page-header-title">
                    <div class="page-header-icon">
                      <i data-feather="user-plus"></i>
                    </div>
                    Add FoodTruck
                  </h1>
                </div>
              </div>
            </div>
          </div>
        </header>
        <!-- 최상단 헤더 -->

        <!-- 메인 컨텐츠 -->
        <div class="container-xl px-4 mt-4 main-bg-color">
          <div class="row">
            <div class="custom-col-xl-8">

              <!-- 업체 조회 -->
              <div class="card mb-4 margin-top">
                <div class="card-header content_title">업체 조회</div>
                <div class="card-body">
                  <table id="datatablesSimple">
                    <thead>
                      <tr>
                        <th>푸드트럭 업체명</th>
                        <th>성명</th>
                        <th>사업자번호</th>
                        <th>전화번호</th>
                      </tr>
                    </thead>

                    <tbody>
                      <c:forEach var="ft" items="${selectFoodTruck}">
                        <tr>
                          <td>
                            <div class="d-flex align-items-center">${ft.ft_name}</div>
                          </td>
                          <td>${ft.ft_owner}</td>
                          <td>${ft.ft_bno}</td>
                          <td>${ft.ft_tel}</td>
                        </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
              <!-- 업체 조회 -->

              <% 
              	HttpSession sessions = request.getSession(); 
              	List<FestivalVO> selectFestival = (List<FestivalVO>)sessions.getAttribute("selectFestival");
              %>
					
                  <!-- 업체 등록 -->
                  <div class="card mb-4">
                    <div class="card-header content_title">참여 업체 등록</div>
                    
                    <form action="addList.do" method="post" onsubmit="return validateForm()">
                      <div class="card-body">
                        <!-- Form Row-->
                        <div class="row gx-3 mb-3">
                        
                        <!-- Hidden input -->
						<input type="hidden" id="selectedFestivalName" name="selectedFestivalName" value="">
                        <input type="hidden" id="selectedFestivalStart" name="selectedFestivalStart" value="">
                        <input type="hidden" id="selectedFestivalEnd" name="selectedFestivalEnd" value="">
                        <input type="hidden" id="selectedFestivalBooth" name="selectedFestivalBooth" value="">
                        <input type="hidden" id="loginId" name="loginId" value="${loginId}">
                        
                          <!-- Form Group (festival name)-->
                          <div class="mb-3">
                            <label class="small mb-1 font-setting" for="inputFirstName">축제명</label>
                            <div name="festival_name">
                              <select id="festivalSelect" class="form-select" aria-label="Default select example">
                                <c:forEach var="f" items="${selectFestival}">
                                  <c:if test="${loginId==f.admin_id}">
                                    <option value="${f.fes_name}">${f.fes_name}</option>
                                  </c:if>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                          <!-- Form Group (festival period)-->
                          <div class="col-md-6">
                            <label class="small mb-1 font-setting" for="inputFirstName">축제 시작 날짜</label>
                            <div name="festival_name">
                              <select id="festivalStartSelect" class="form-select" aria-label="Default select example">
                                <c:forEach var="f" items="${selectFestival}">
                                  <c:if test="${loginId==f.admin_id}">
                                    <option value="${f.fes_start}">${f.fes_start}</option>
                                  </c:if>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        
                        <!-- Form Group (festival period)-->
                          <div class="col-md-6">
                            <label class="small mb-1 font-setting" for="inputFirstName">축제 종료 날짜</label>
                            <div name="festival_name">
                              <select id="festivalEndSelect" class="form-select" aria-label="Default select example">
                                <c:forEach var="f" items="${selectFestival}">
                                  <c:if test="${loginId==f.admin_id}">
                                    <option value="${f.fes_end}">${f.fes_end}</option>
                                  </c:if>
                                </c:forEach>
                              </select>
                            </div>
                          </div>
                        </div>
                        <!-- Form Group (booth num)-->
                        <div class="mb-3 margin-top">
                          <label class="small mb-1 font-setting">부스번호(지정위치 번호)</label>
                          <select id="boothSelect" class="form-select" aria-label="Default select example">
                            <c:forEach var="b" items="${selectFestivalLoc}">
                              <option value="${b.fes_loc_name}">${b.fes_loc_name}</option>
                            </c:forEach>
                          </select>
                        </div>
                        <!-- Form Group (business num)-->
                        <div class="mb-3">
                          <label class="small mb-1 font-setting" for="inputLastName">사업자번호</label>
                          <input name="input_bno" class="form-control" id="inputFirstName" type="text" placeholder="지정할 사업자번호를 입력하세요."
                            value="">
                        </div>
                        <!-- Submit button-->
		                  <div class="card mb-4">
		                        <button class="btn btn-primary addbtn-color" type="submit" onclick="setSelectedFestivalName(); getdata();">추가하기</button>
		                  </div>
                      </div>
                      
                      </form>
                      
                      </div>
                  </div>
            </div>
            <!-- 업체 등록 -->
            
            
            
            
            <!-- 등록한 업체 -->
            <div class="card margin-bottom">
              <div class="card-header content_title">등록한 업체</div>
              <div class="card-body">
                <table id="datatablesSimple">
                  <thead>
                    <tr>
                      <th>축제명</th>
                      <th>축제기간</th>
                      <th>부스번호</th>
                      <th>사업자번호</th>
                      <th>Actions</th>
                    </tr>
                  </thead>

                  <tbody>
                    <c:forEach var="a" items="${selectAddList}">
                    <c:if test="${loginId==a.admin_id}">
                      <tr>
                        <td>
                          <div class="d-flex align-items-center">${a.fes_name}</div>
                        </td>
                        <td>${a.fes_start} ~ ${a.fes_end}</td>
                        <td>${a.fes_loc_name}</td>
                        <td>${a.ft_bno}</td>
                        <td><a class="btn btn-datatable btn-icon btn-transparent-dark" href="deleteList.do?num=${a.list_idx}" onclick="confirmDelete(${a.list_idx})"><i
                              data-feather="trash-2"></i></a>
                        </td>
                      </tr>
                     </c:if>
                     </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <!-- 등록한 업체 -->
            
          </div>
          </main>
        </div>
    </div>
    
    <!-- <footer class="footer-admin mt-auto footer-light">
				<div class="container-xl px-4">
					<div class="row">
						<div class="col-md-6 small">Copyright &copy; Your Website
							2021</div>
						<div class="col-md-6 text-md-end small">
							<a href="#!">Privacy Policy</a> &middot; <a href="#!">Terms
								&amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer> -->
  </div>
  </div>
  
  
  
<script>
            	
// select 부분에서 파라미터값을 넘겨주기 위한 스크립트
function setSelectedFestivalName() {
    var festivalSelect = document.getElementById("festivalSelect").value;
    var festivalStartSelect = document.getElementById("festivalStartSelect").value;
    var festivalEndSelect = document.getElementById("festivalEndSelect").value;
    var boothSelect = document.getElementById("boothSelect").value;
    
    document.getElementById("selectedFestivalName").value = festivalSelect;
    document.getElementById("selectedFestivalStart").value = festivalStartSelect;
    document.getElementById("selectedFestivalEnd").value = festivalEndSelect;
    document.getElementById("selectedFestivalBooth").value = boothSelect;
    
}

// 사업자 번호 미입력 시 폼 제출 방지
function validateForm() {
    var businessNumber = document.getElementById("inputFirstName").value;

    if (businessNumber === "") {
        // 경고창을 띄우고, 폼 제출을 중단
        alert("사업자 번호를 입력하세요.");
        return false; // 폼 제출 중단
    }

    // 모든 조건을 만족하면 true, 폼 제출
    return true;
}

function confirmDelete(listIdx) {
    if (confirm("삭제하시겠습니까?")) {
        // 사용자가 확인을 누르면 삭제 작업을 수행
        window.location.href = "deleteList.do?num=" + listIdx;
    } else {
        // 사용자가 취소를 누르면 동작하지 않음
    	event.preventDefault();
    }
}

</script>
  
  
  
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
  <script src="js/datatables/datatables-simple-demo.js"></script>
</body>

</html>