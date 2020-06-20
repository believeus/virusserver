<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<div style="width: 100%;height: auto">
			<div style="width: 100%;height: 20px;"></div>
			<div id="head" name="head" style="height: 100px;width: 100%;">
				<div style="float: left;width: 15%;height:100%;"></div>
				<div style="float: left;width: 12%;height: 100%;">
					<img alt="epi-logo" width="190px" height="90px" src="static/image/logo.jpg">
				</div>
				<div style="float: left;width: 8%;height: 100%;"></div>
				<div style="float: left;width: 40px;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">首页</a>
				</div>
				<div style="float: left;width: 30px;height: 100%;"></div>
				<div style="float: left;width: 40px;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">商店</a>
				</div>
				<div style="float: left;width: 5%;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">公司</a>
				</div>
				<div style="float: left;width: 8%;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">癌症早期筛查</a>
				</div>
				<div style="float: left;width: 6%;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">健康老龄化</a>
				</div>
				<div style="float: left;width: 6%;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">研究服务</a>
				</div>
				<div style="float: left;width: 40px;height: 100%;line-height: 100px;text-align: center;">
					<a href="#" style="text-decoration: none;color: grey">更多</a>
				</div>
				<div style="float: left;width: 100px;height: 100%;"></div>
				<div style="float: left;width: 40px;height: 100%;line-height: 100px;text-align: center;background: url('static/image/cart.jpg') no-repeat center;cursor: pointer;"></div>
			</div>
			<div style="width: 100%;height: 100px;background-color: #0f71a7">
				<div style="float: left;width: 100%;height: 50px;text-align: center;line-height: 50px;color: white;font-size: 18px;">Your Journey to Healthier Ageing!</div>
				<div style="float: left;width: 100%;height: 50px;text-align: center;color: #f1f2f6;">Harnessing the power of the epigenome for healthy aging</div>
			</div>
		</div>