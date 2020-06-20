<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" type="text/css" href="static/css/myAlert.css">
		<title>Registration</title>
		<script type="text/javascript " src="static/js/jquery.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.validate.min.js"></script>
		<script type="text/javascript" src="static/js/jquery.md5.js"></script>
		<script type="text/javascript" src="static/js/myAlert.js"></script>
	</head>

	<body style="padding: 0px;margin: 0px;">
		<div id="container" style="width: 100%;height: 100%;">
			<div style="width: 100%;height: auto;color: #505050;">
				<div style="width: 100%;height: 60px;"></div>
				<div style="width: 80%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 70px;">
						<div style="width: 100%;height: 40px;font-family: arial;font-size: 26px;font-weight: 900;float: left;">Sign in</div>
					</div>
					<form id="signform" name="signform" method="post" action="#">
							<p style="width: 100%;height: 25px;font-family: arial;font-size: 18px;font-weight: 800;">Email</p>
							<div id="email">
								<input type="email" name="email" id="email"  placeholder="Email" style="width:100%;height: 48px;font-size: 22px;padding-left: 10px; border: 2px solid #808080;">
							</div>
							<p style="width: 100%;height: 25px;font-family: arial;font-size: 18px;font-weight: 800;">Password</p>
							<div id="password">
								<input type="password" name="password"  id="password"  placeholder="Password"  style="width:100%;height: 48px;font-size: 22px;padding-left: 10px; border: 2px solid #808080;">
							</div>
							<!-- <div style="width: 100%;height: 88px;font-size: 20px;line-height: 70px;">
								<input type="checkbox" value="" name="sign" style="font-size: 18px;width: 8%;height: 18px;" />Keep me signed in
							</div> -->
							<div>
								<input type="submit" id="signin" value="Sign In" style="width: 100%;height: 55px;background-color:#0070B8 ;color: #FFFFFF;font-weight: 600;font-size: 24px;border-radius: 10px;"/>
							</div>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			$("#signform").validate({
				 rules: {
		                email: {
		                    required: true,
		                    email: true
		                },
		                password: {
		                    required: true,
		                }
		            },
			 submitHandler:function(form){
				 var data={}
				  data.email=form.email.value
				  data.password=$.md5(form.password.value)
				 $.post("ulogin.jhtml",data,function(user){
					 if(user!=""){
						location.href="keyview.jhtml"
					}else{
						MyAlert( {
							title: "Message",
							msg: "Wrong user name or password",
							button:{
								ok: "OK",
								// "cancle": "否",
								okEvent: function(){
									
								},
								cancleEvent: function(){
									
								}
							}
						});
					}
					 
					  
				 })
                
             }    
			  })
		})
	</script>
</html>