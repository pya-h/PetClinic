<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PetClinic.Views.Authentication.Login" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pet Clinic | Login</title>
    <link rel="stylesheet" href="../../Libraries/Bootstrap/css/bootstrap.min.css" />
    <link href="../../Public/CSS/LoginFonts.css" rel="stylesheet" />

	<link rel="stylesheet" href="../../Libraries/FontAwsome/font-awesome.min.css" />
	
	<link rel="stylesheet" href="../../Public/CSS/Login.css" />
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <div class="img js-fullheight">
                <section class="ftco-section">
		            <div class="container">
			            <div class="row justify-content-center">
				            <div class="col-md-6 text-center mb-5">
					            <h2 class="heading-section">Login</h2>
				            </div>
			            </div>
			            <div class="row justify-content-center">
				            <div class="col-md-6 col-lg-4">
					            <div class="login-wrap p-0">
		      	            <h3 class="mb-4 text-center">Have an account?</h3>
		      	            <form runat="server" class="signin-form">
		      		            <div class="form-group">
		      			            <input type="text" id="txtUsername" name="username" class="form-control" placeholder="Username" required="required" runat="server" />
		      		            </div>
								<div class="form-group">
								  <input id="txtPassword" type="password" name="password" class="form-control" placeholder="Password" required="required" runat="server"/>
								  <span toggle="#txtPassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
								</div>
								<div class="form-group">
									<asp:Button ID="btnLogin" type="submit" class="form-control btn btn-primary submit px-3" Text="Login" runat="server" OnClick="btnLogin_Click" />
								</div>
								<div class="form-group d-md-flex">
									<div class="w-100 row text-md-right">
										<div class="col-6">
											New To PetClinic?
										</div>
										<div class="col-6">
											<a href="Register.aspx" style="color: darkgreen">Register here</a>
										</div>
									</div>
								</div>
								<label id="lblError" style="color:red" runat="server"></label>
	                      </form>
		                  </div>
				            </div>
			            </div>
		            </div>
	            </section>

	          <script src="../../Libraries/JQuery/jquery.min.js"></script>
              <script src="../../Public/JS/popper.js"></script>
              <script src="../../Libraries/Bootstrap/js/bootstrap.min.js"></script>
              <script src="../../Public/JS/main.js"></script>
            </div>
        </div>
    </div>
</body>
</html>
