<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
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
		<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
		<script type="text/javascript">
		$(function(){
			$("#publickeyGenerate").click(function(){
				$("#publickey").val('xxxxxxxx-xxxx-4xxx'.replace(/[xy]/g, function(c) {var r = Math.random()*16|0,v=c=='x'?r:r&0x3|0x8;return v.toString(16);}).toUpperCase())
			})
			$("#privatekeyGenerate").click(function(){
				$("#privatekey").val('xxxxxxx'.replace(/[xy]/g, function(c) {var r = Math.random()*16|0,v=c=='x'?r:r&0x3|0x8;return v.toString(16);}).toUpperCase())
			})
			var keyvalue=$.cookie($.md5("${sessionUser.mail}")).split("_") 
			$("#publickey").val(keyvalue[0])
			$("#privatekey").val(keyvalue[1])
		})
  </script>
  <script type="text/javascript">
		$(function(){
			$("#signform").validate({
				 rules: {
					 publickey: {
		                    required: true
		                },
		                privatekey: {
		                    required: true,
		                }
		            },
			 submitHandler:function(form){
				  var publickey=form.publickey.value
				  var privatekey=form.privatekey.value
				  $.cookie($.md5("${sessionUser.mail}"),publickey+"_"+privatekey , { expires: 1000 });
				  MyAlert( {
						title: "Message",
						msg: "The Unique  private and public keys have been saved to your browser",
						button:{
							ok: "OK",
							// "cancle": "否",
							okEvent: function(){
								location.href="/"
							},
							cancleEvent: function(){
								
							}
						}
					});
             }    
			  })
		})
	</script>
	</head>

	<body style="padding: 0px;margin: 0px;">
		<div id="container" style="width: 100%;height: 100%;">
			<div style="width: 100%;height: auto;color: #505050;">
			   <span>&nbsp;&nbsp;<a href="/"  style="color: blue;font-size: 30px;font-weight: bold;">Home</a></span>
				<div style="width: 100%;height: 60px;"></div>
				<div style="width: 80%;height: auto;margin: 0 auto;">
					<div style="width: 100%;height: 70px;">
						<div style="width: 100%;height: 40px;font-family: arial;font-size: 26px;font-weight: 900;float: left;">Data security Setting</div>
					</div>
					<form id="signform" name="signform" method="post" action="#">
							<p style="width: 100%;height: 25px;font-family: arial;font-size: 18px;font-weight: 800;">Public key</p>
							<div  style="width: 100%;height: auto;">
								<div style="width: 60%;float: left;"><input name="publickey" id="publickey"  placeholder="publickey" style="width:98%;height: 48px;font-size: 22px;padding-left: 10px; border: 2px solid #808080;"/></div>
								<div style="width: 5%;float: left;"></div>
								<div style="width: 30%;float: left;">
									<input type="button" id="publickeyGenerate"  value="Generate"   style="width: 100%;height: 48px;background-color:#0070B8 ;color: #FFFFFF;font-weight: 600;font-size: 24px;border-radius: 10px;"/>
								</div>
							</div>
							<div style="width: 100%;clear: both;height: 10px"></div>
							<p style="width: 100%;height: 25px;font-family: arial;font-size: 18px;font-weight: 800;">Private key</p>
							<div  style="width: 100%;height: auto;">
								<div style="width: 60%;float: left;"><input name="privatekey" id="privatekey"  placeholder="privatekey" style="width:98%;height: 48px;font-size: 22px;padding-left: 10px; border: 2px solid #808080;"/></div>
								<div style="width: 5%;float: left;"></div>
								<div style="width: 30%;float: left;"><input type="button" id="privatekeyGenerate" value="Generate" style="width: 100%;height: 48px;background-color:#0070B8 ;color: #FFFFFF;font-weight: 600;font-size: 24px;border-radius: 10px;"/></div>
							</div>
							<div style="width: 100%;clear: both;height: 10px"></div>
							<div style="width: 100%;">
								<input type="submit" id="save" name="save" value="save" style="width: 90%;height: 55px;background-color:#0070B8 ;color: #FFFFFF;font-weight: 600;font-size: 24px;border-radius: 10px;"/>
							</div>
							<div style="width: 100%;height: auto;font-size: 20px;">
								1.Please press the 'GENERATE' button to generate your Unique Public key and Privatelic key. Then, by pressing 'SAVE',the Unique Public key and Private key will be saved to your brower.
							</div>
							<div style="width: 100%;height: 5px;clear: both;"></div>
							<div style="width: 100%;height: auto;font-size: 20px;">
								2.Once the keys are set, no changes are allowed. If the Public key and Private key were changed, all previously saved healthy data will be lost. New healthy data will be encrypted using a new key,and it can only be set once
							</div>
							<div style="width: 100%;height: 5px;clear: both;"></div>
							<div style="width: 100%;height: auto;font-size: 20px;">
								3.We will not have or save the user's private key to decrypt user data according to the Data Security Statement and HIPPA Law
							</div>
							<div style="width: 100%;height: 5px;clear: both;"></div>
							<div style="width: 100%;height: auto;font-size: 20px;">
								4.When you are not logged into the system, your health information and personal user information will be in a 'free' state, and no one can find your associated information between them.please save your only private key.
							</div>
							<div style="width: 100%;height: 5px;clear: both;"></div>
							<div style="width: 100%;height: auto;font-size: 20px;">
								5.The Unique Public key and Private key will be required to enter again if the user logs in again
							</div>
					</form>
				</div>
			</div>
		</div>
	</body>

</html>