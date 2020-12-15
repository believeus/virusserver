<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="date" uri="/tag/datetag.tld"%>  
<!DOCTYPE html>
<html>
	<head>
	 	<base href="<%=basePath%>">
		<meta charset="UTF-8">
		<title>virus report sample</title>
		<style>
			#container{
				height: auto;
				width: 70%;
				margin: 0 auto;
				position: relative;
			}
			#img{
				width: 100%;
				margin: 0 auto;
				text-align: center;
			}
			#title{
				font-size: 38px;
				font-family: "arial black";
				width: 100%;
				height: 100%;
				padding-top: 45px;
				text-align: center;
				margin: 0 auto;
			}
			.sub-title-box{
				width: 100%;
				height: 123px;
			}
			span{
			font-family: sans-serif;
			}
			h3{
				width: 100%;
				height: auto;
				font-size: 23px;
				font-family: sans-serif;
				text-decoration: underline
			}
			.info-box{
				margin-top: 23px;
				font-size: 23px;
			}
			#result{
				width: 100%;
				height: 78px;
				font-size: 28px;
				font-weight: 800;
				margin-top: 45px;
			}
			#remark{
				margin: 0 auto;
				height: 189px;
				padding: 23px;
				font-size: 20px;
				overflow: hidden;
				border: 1px solid maroon;
			}
		</style>
	</head>
	<body style="padding: 0;margin: 0;">
		<div id="container">
			<div>
				<div id="img">
				 <img  src="static/image/virusbar.png"/>
				</div>
				
				<div style="width: 100%;height: 56px;"></div>
				<div class="sub-title-box">
					<h3 >Patient's Information:</h3>
					<div class="info-box">
						<div><span class="fill-info">Patient's Name :</span> <span id="patient-name">${pdf.patientname}</span></div>
						<div><span class="fill-info">Simple's Id :</span> <span id="simple- Id">${pdf.barcode}</span></div>
					</div>
				</div>
				<div class="sub-title-box">
					<h3 >Run Information:</h3>
					<div class="info-box">
						<div>
						<span class="fill-info">Plate ID :</span> <span id="plate-id">${pdf.parent}</span>
						</div>
						<div>
						<span class="fill-info">Assay :</span> <span id="assay">SARS-CoV-2</span>
						</div>
					</div>
				</div>
				
				<div class="sub-title-box">
					<h3 >Colorimetric Scanning Information:</h3>
					<div class="info-box">
						<div>
						<span class="fill-info">Date: </span> <span id="color-scan-date"><date:date pattern="yyyy-MM-dd HH:mm:ss" value="${pdf.createtime}"/></span>
						</div>
						<div>
						<span class="fill-info">Lab's Director:</span> <span id="color-scan-person">${pdf.labdirector}</span>
						</div>
					</div>
				</div>
				<div id="result">
					<span >Test Result: </span>
					<span id="test-result">
						<c:choose>
							<c:when test="${pdf.positive==1}"><span style="color:red">POSITIVE</span></c:when>
							<c:otherwise><span style="color:green">NEGATIVIE</span> </c:otherwise>
						</c:choose> 
					</span>
				</div>
				<h2>Remark: </h2>
				<div id="remark">${pdf.note}</div>
			</div>
			<div><div style="float:right;"><img src="static/image/logo.png"></div></div>
		</div>
	</body>
</html>
