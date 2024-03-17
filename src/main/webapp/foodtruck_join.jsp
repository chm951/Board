<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>QTOrder</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/yg.css" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.28.0/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body style="background-color: #FA823C">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container-xl px-4">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <!-- Basic registration form-->
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center"><h3 class="fw-light my-4">����� ȸ������</h3></div>
                                    <div class="card-body">

									<form>
										<div class="row gx-3">
											<div class="mb-3">
												<label class="small mb-1" for="business_num">����� ��ȣ</label>
												<input id="bus_num" class="form-control" id="business_num"
													type="text" placeholder="������(-)��ȣ�� ���� ����ڹ�ȣ�� �Է����ּ���" />
											</div>
										</div>
										<div class="row gx-3">
											<div class="col-md-6">
												
												<div class="mb-3">
													<label class="small mb-1" for="bus_name">�̸�</label>
													<input class="form-control" id="bus_name"
														type="text" placeholder="�̸��� �Է����ּ���" />
												</div>
											</div>
											<div class="col-md-6">
												
												<div class="mb-3">
													<label class="small mb-1" for="inputConfirmPassword">��������</label>
													<input class="form-control"
														id="open_date" type="text"
														placeholder="ex)20010101" />
												</div>
											</div>
										</div>
										
										<button id="bus_btn" type="button" class="btn btn-qtbtn" onclick="bus_num_check()" value=0> ����� ��ȣ Ȯ��</button>
										
										<div class="row gx-3">
											<div class="mb-3">
												<label class="small mb-1" for="bus_phone">��ȭ��ȣ</label>
												<input id="bus_phone" class="form-control" id="bus_phone"
													type="text" placeholder="��ȭ��ȣ�� �Է����ּ���" />
											</div>
										</div>
										<div class="row gx-3">
											<div class="mb-3">
												<label class="small mb-1" for="ft_name">�����</label>
												<input id="ft_name" class="form-control" id="ft_name"
													type="text" placeholder="�����̸��� �Է����ּ���. ���� ���� �����մϴ�." />
											</div>
										</div>
										
										<div class="row gx-3">
											<div class="col-md-6">
												<div class="mb-3">
													<label class="small mb-1" for="inputPassword">��й�ȣ</label>
													<input class="form-control" id="inputPassword"
														type="password" placeholder="Enter password" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="mb-3">
													<label class="small mb-1" for="inputConfirmPassword">��й�ȣ Ȯ��</label>
													<input class="form-control"
														id="inputConfirmPassword" type="password"
														placeholder="Confirm password" />
												</div>
											</div>
										</div>
										
										<button class="btn btn-qtbtn btn-block" onclick="join_check()" type="button">ȸ������</button>
									</form>
								</div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="auth-login-basic.html">�̹� ȸ���̽Ű���? �α����������� �̵�</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script type="text/javascript">
		
			function bus_num_check() {
				let num = document.getElementById("bus_num").value;
				let name = document.getElementById("bus_name").value;
				let date = document.getElementById("open_date").value;
				
				var data = {
						  "businesses": [
							    {
							      "b_no": num,
							      "start_dt": date,
							      "p_nm": name,
							      "p_nm2": "",
							      "b_nm": "",
							      "corp_no": "",
							      "b_sector": "",
							      "b_type": "",
							      "b_adr": ""
							    }
							  ]
							}

				$.ajax({
					url : "https://api.odcloud.kr/api/nts-businessman/v1/validate?serviceKey=VsuwnPoY8dv9qf%2B33XYqkhFAM9bSBmNORC1IvY077FhF3IwpemXO6Rh9%2FE3uEq0SMHjS6zgoAfG1afxFD8nzHA%3D%3D", // serviceKey ���� xxxxxx�� �Է�
					type : "POST",
					data : JSON.stringify(data),
					dataType : "JSON",
					contentType : "application/json",
					accept : "application/json",
					success : function(result) {
//						console.log(result.data[0].valid);
						let tax_type = result.data[0].valid;

						if (tax_type == "02") {
							alert("��ϵ��� ���� �����Դϴ�.");
							document.getElementById("bus_num").value = "";
							document.getElementById("bus_name").value = "";
							document.getElementById("open_date").value = "";
							document.getElementById("bus_btn").value = 0;
						} else {
							alert("Ȯ�οϷ�Ǿ����ϴ�.");
							document.getElementById("bus_btn").value = 1;
						}

					},
					error : function(result) {
						console.log(result.responseText);
					}
				});
			}

			function join_check() {
				let b_num = document.getElementById("bus_num").value;
				
				let pass = document.getElementById("inputPassword").value;
				let pass_check = document.getElementById("inputConfirmPassword").value;
				
//				console.log(b_num);
				if (b_num != "") {
					let btn_val = document.getElementById("bus_btn").value;
					if (btn_val == 0) {
						alert("����ڹ�ȣ Ȯ���� ���� �����̽��ϴ�.");

					} else {
						if(pass !== pass_check || pass == ""){
							alert("�Է��Ͻ� ��й�ȣ�� �ٸ��ϴ�.")
						}else{
							let b_num = document.getElementById("bus_num").value;
							let b_name = document.getElementById("bus_name").value;
							let b_phone = document.getElementById("bus_phone").value;
							let ft_name = document.getElementById("ft_name").value;
							let pass = document.getElementById("inputPassword").value;
							
							$.ajax({
								url : 'http://localhost:8081/QRservice/fd_join.do',
								type : "POST",
								data :{
									b_num:b_num, // ����ڹ�ȣ
									b_name:b_name, // ������̸�
									b_phone:b_phone, // �������ȭ��ȣ
									bf_name:ft_name, // ȸ���
									pass:pass // ��й�ȣ
								},
								success : function(result) {
									if(result){
										alert("ȸ�������� �Ϸ��ϼ̽��ϴ�.");
										window.location.href = "foodtruck_login.jsp";
									}else{
										alert("���ͳݿ� ������ �ֽ��ϴ�. ��� �� �ٽ� �õ����ּ���.")
									}
								},
								error : function() {

								}
							});
							
						}
					}
				} else {
					alert("����ڹ�ȣ�� �Է����� �����̽��ϴ�.")
				}
			}
		</script>
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
