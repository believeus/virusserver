<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

<title>Home</title>
<style>
	*{font-family: calibri}
	a:hover {
		font-size: 18px;
		font-weight: bold;
	}
</style>
<script type="text/javascript " src="static/js/jquery.min.js"></script>
<script type="text/javascript" src="static/js/swiper.slider.js"></script>
<link rel="stylesheet" type="text/css" href="static/css/swiper.slider.css">
<link rel="stylesheet" type="text/css" href="static/css/font.css">
 <script>
 		$(function(){
 			$('#slider-1').Slider();
 			$('#slider-2').Slider();
 		})
        </script>
</head>

<body style="padding: 0px;margin: 0px;">
	<div id="container" style="width: 100%;height: 100%;">
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
		
		<div class="slider" id="slider-1" style="height: 500px">
		  <div class="slider-inner">
		    <div class="item">
		    	<div class="img" style="background: url('static/image/barner-dna.jpg');">
		    			<div style="width: 100%;height: 50px;"></div>
		    			<div style="width: 100%;height: 50px;text-align: center;font-size: 60px;color: white;">We are the DNA</div>
		    			<div style="width: 100%;height: 10px;"></div>
		    			<div style="width: 100%;height: 50px;text-align: center;font-size: 60px;color: white;">methylation team</div>
		    			<div style="width: 100%;height: 50px;"></div>
		    			<div style="width: 100%;height: 50px;">
		    				<div style="background-color: #00a7ce;height: 50px;margin: 0 auto;text-align: center;width: 10%;color: white;line-height: 50px;font-size: 20px;">Learn More</div>
		    			</div>
		    	</div>
		    </div>
		    <div class="item"><div class="img" style="background: url('static/image/barner-old.jpg');"></div></div>
		    <div class="item"><div class="img" style="background: url('static/image/barner-same.jpg');"></div></div>
		  	<div class="item"><div class="img" style="background: url('static/image/barner-old-2.jpg');"></div></div>
		  	<div class="item"><div class="img" style="background: url('static/image/barner-run.jpg');"></div></div>
		  	<div class="item"><div class="img" style="background: url('static/image/barner-vitamins.jpg');"></div></div>
		  	
		  </div>
		</div>
		
      <div style="width: 100%;height: 50px"></div>
       <div style="width: 100%;height: 250px">
        	<div style="width: 25%;height: 100%;float: left;"></div>
        	<div style="width: 25%;height: 100%;float: left;background-color: #f1f2f6">
        		<div style="width: 45%;height: 100%;float: left;">
        			<div style="float: left;width: 15%;height: 100%;"></div>
        			<div style="float: left;width: 80%;height: 100%">
        			   <div style="width: 100%;float: left;height: 20px;"></div>
	        			<div style="width:100%;float: left;font-size: 20px;font-weight: bold;height:60px;line-height:60px;">Epiaging &nbsp;Kit</div>
	        			<div style="width: 100%;float: left;font-size: 12px;height: 20px;color: grey;">Epigenetic age</div>
	        			<div style="width: 100%;float: left;font-size: 12px;height: 20px;color: grey;">Detection 2.0</div>
	        			 <div style="width: 100%;float: left;font-size: 24px;height: 60px;color: #FF6100;line-height: 60px;">$145</div>
	        			 <div style="width: 100%;float: left;height: 30px">
	        			         <div style="width: 50%;float: left;font-size: 12px;text-align: center;height: 30px;color: white;line-height: 30px;border-radius:20px;background-color: #FF6100">Show now</div>
	        			 </div>
        			</div>
        		</div>
        		<div style="width: 50%;height: 100%;float: left;text-align: center; ">
        			<div style="width: 100%;height: 50px;"></div>
        			<img width="180px" src="static/image/dna-meth.jpg">
        		</div>
        	</div>
        	<div style="width: 1%;height: 100%;float: left;"></div>
        	<div style="width: 25%;height: 100%;float: left;background-color: #f1f2f6">
        		<div style="width: 50%;height: 100%;float: left;">
        		    <div style="float: left;width: 15%;height: 100%;"></div>
        			<div style="float: left;width: 85%;height: 100%">
	        			<div style="width: 100%;height: 20px;"></div>
	        			<div style="width:100%;font-size: 20px;font-weight: bold;height:60px;line-height:60px;">Epi &nbsp;SAME</div>
	        			<div style="width: 100%;font-size: 12px;height: 20px;color: grey;">SAME is natural nutrition</div>
	        			<div style="width: 100%;font-size: 12px;height: 20px;color: grey;">supplement in humen body</div>
	        			 <div style="width: 100%;font-size: 24px;height: 60px;color: #FF6100;line-height: 60px;">$42</div>
	        			 <div style="width: 100%;height: 30px">
	        			         <div style="width: 50%;float: left;font-size: 12px;text-align: center;height: 30px;color: black;line-height: 30px;border-radius:20px;border: 1px solid black;">Show now</div>
	        			 </div>
        			 </div>
        		</div>
        		<div style="width: 50%;height: 100%;float: left;text-align: center; ">
        				<div style="width: 100%;height: 20px;"></div>
        				<img width="160px" src="static/image/same.jpg">
        		</div>
        	</div>
        	<div style="width: 20%;height: 100%;float: left;"></div>
       </div>
         <div style="width: 100%;height: 50px"></div>
         <div style="width: 100%;height: 600px;background-color: #f1f2f6">
         	 <div style="width: 100%;height: 80px;"></div>
         	 <div style="width: 100%;height: 40px;font-size:32px;font-weight: bold;text-align: center;">Meet Dr.Moshe Szyf</div>
        	 <div style="width: 100%;height: 20px;font-size:18px;text-align: center;color: #;">A leading-edge force in emerging science of Epigenetics</div>
         	 <div style="width: 100%;height: 120px;text-align: center;margin:20px auto;"><img src="static/image/moshe.jpg"></div>
         	 <div style="width: 100%;height: 30px;text-align: center;color:blue;font-size: 18px;">Chairman & CEO</div>
         	 <div style="width: 100%;height: 100px;color: grey;">
         	  		<div style="width: 25%;height: 100%;float: left;"></div>
         	  		<div style="width: 50%;height: 100%;float: left;text-align: center;">But Szyf is not known for the company he keeps. Szyf is renowned for three decades of his revolutionary research in genetics, early cancer detection and presenting the first evidence that our genetic makeup is not fixed at birth. Rather, according to Szyf, our genetic code may be changed by a biochemical process called DNA Methylation</div>
         	  		<div style="width: 25%;height: 100%;float: left;"></div>
         	  </div>
         	  <div style="width:100%;height: 40px;">
         	  		<div style="width:37%;float: left;height:100%;"></div>
         	  		<div style="width:12.5%;float: left;height: 100%;line-height:40px;background-image: linear-gradient(100deg, rgb(33, 189, 202) 0%, rgb(13, 110, 184) 100%);border-radius:20px;color: white;text-align: center;background-color: rgb(33, 189, 202);cursor: pointer; ">More About Dr Moshe Szyf</div>
         	  		 <div style="width:1%;float: left;height:100%;"></div>
         	  		<div style="width:12.5%;float: left;height: 100%;line-height:40px;background-image:linear-gradient(117deg, rgb(247, 147, 0) 0%, rgb(221, 125, 0) 100%);border-radius:20px;color: white;text-align: center;background-color:rgb(247, 147, 0);cursor: pointer; ">More About Our Team</div>
         	  		<div style="width:37%;float: left;height: 100%"></div>
         	  </div> 
         </div>
         
         <div class="slider" id="slider-2" style="height: 670px">
			  <div class="slider-inner">
			    <div class="item">
			    		<div style="float: left;width: 50%;height:670px;background-color: rgb(24,156,160)">
                		<div style="width: 100%;height:30%;"></div>
                		<div style="width: 100%;height: 400px;color: white;">
                			<div style="width: 30%;height: 400px;float: left;"></div>
                			<div style="width: 40%;height: 400px;float: left;">
                				<div style="width: 100%;height: 80px;text-align: left;font-size: 20px;">A dynamic long term Partnership to achieve Healthy Aging</div>
                				 <div style="width: 100%;height: 20px;"></div>
                				 <div style="width: 100%;height: 80px;text-align: left;font-size: 16px;color: #efefef;">Early Sense Receives Back-To-Back Awards Following 2018 “Healthcare Analytics Innovation Award” Selection</div>
                				<div style="width: 100%;height: 20px;"></div>
                				<div style="width: 100%;height: 1px;background-color: white;"></div>
                				 <div style="width: 100%;height: 10px;"></div>
                				  <div style="width: 100%;height: 10px;">Learn Morn -></div>
                			</div>
                			<div style="width: 30%;height: 400px;float: left;"></div>
                		</div>
                	</div>
                	 <img class="img" style="float: left;width: 50%;height:670px;background: url('static/image/swiper-run.jpg');border: none;"/>
			    </div>
			    <div class="item">
			    		<div style="float: left;width: 50%;height: 670px;background-color: rgb(16,113,168)">
                		<div style="width: 100%;height:30%;"></div>
                		<div style="width: 100%;height: 400px;color: white;">
                			<div style="width: 30%;height: 400px;float: left;"></div>
                			<div style="width: 40%;height: 400px;float: left;">
                				<div style="width: 100%;height: 20px;text-align: left;font-size: 20px;">How old are you Really？</div>
                				 <div style="width: 100%;height: 10px;"></div>
                				 <div style="width: 100%;height: 40px;text-align: left;font-size: 16px;color: #efefef;">Biological age can be measured with only 1ml saliva sample.</div>
                				<div style="width: 100%;height: 20px;"></div>
                				<div style="width: 100%;height: 1px;background-color: white;"></div>
                				 <div style="width: 100%;height: 10px;"></div>
                				  <div style="width: 100%;height: 10px;">Learn Morn -></div>
                			</div>
                			<div style="width: 30%;height: 400px;float: left;"></div>
                		</div>
                		</div>
                		<img class="img" style="float: left;width: 50%;height: 670px;background: url('static/image/swiper-kiss.jpg');border: none;"/>
			    </div>
			    <div class="item">
			    		<div style="float: left;width: 50%;height: 670px;background-color: rgb(240,105,102)">
                		<div style="width: 100%;height:30%;"></div>
                		<div style="width: 100%;height: 400px;color: white;">
                			<div style="width: 30%;height: 400px;float: left;"></div>
                			<div style="width: 40%;height: 400px;float: left;">
                				<div style="width: 100%;height: 80px;text-align: left;font-size: 20px;">Discover your Biological age Through DNA methylation</div>
                				 <div style="width: 100%;height: 10px;"></div>
                				 <div style="width: 100%;height: 150px;text-align: left;font-size: 16px;color: #efefef;">Stop counting your age by birthdays or candles on the cake, wrinkles, crow’s feet or the frown lines on your face — those are only numbers. Today, the numbers don’t matter. The only number that matters is your biological DNA age.</div>
                				<div style="width: 100%;height: 20px;"></div>
                				<div style="width: 100%;height: 1px;background-color: white;"></div>
                				 <div style="width: 100%;height: 10px;"></div>
                				  <div style="width: 100%;height: 10px;">Learn Morn -></div>
                			</div>
                			<div style="width: 30%;height: 400px;float: left;"></div>
                		</div>
                		</div>
                		<img class="img" style="float: left;width: 50%;height: 670px;background: url('static/image/swiper-birth.jpg');border: none;"/>
			    </div>
			  </div>
		</div>

		<div style="width: 100%;height: 50px;background-color: #f1f2f6"></div>
		<div style="width: 100%;height: 600px;background-color: #f1f2f6">
			<div style="width:50%;height: 100%;float: left;">
				<div style="width: 100%;height: 180px;"></div>
				<div style="float: left;width: 30%;height:180px "></div>
				<div style="float: left;width: 40%;height:180px ">
					<div style="width:100%;height: 45px;text-align: center;font-weight: bold;font-size:28px;">Discover you</div>
					<div style="width:100%;height: 45px;text-align: center;font-weight: bold;font-size:28px;">Biological age</div>
					<div style="width:100%;height: 45px;text-align: center;font-size:18px;color:grey;line-height:45px; ">get the EpiAging app</div>
					<div style="width:100%;height: 45px;text-align: center;font-size:18px;color:grey; ">
						<div style="float: left;width: 20%;height:100% "></div>
						<div style="background-color: #FF6100;border-radius:20px;width: 60%;height: 100%;float: left;text-align: center;line-height: 45px;color: white;">Download App</div>
						<div style="float: left;width: 20%;height:100% "></div>
					</div>
				</div>
				<div style="float: left;width: 30%;height:180px "></div>
			</div>
			<div style="width:50%;height: 100%;float: left; ">
				<img width="467px" height="612px"  alt="" src="static/image/iphone.jpg">
			</div>
		</div>
		<div style="width: 100%;height: 50px;background-color: #f1f2f6"></div>
		<div style="width: 100%;height: 400px;background-color: white;">
			<div style="width: 100%;height: 150px;text-align: center;line-height: 150px;font-size:32px;font-weight: bold;">How it works</div>
			<div style="width: 100%;height: 20px"></div>
			<div style="width: 100%;height: 300px">
				<div style="width: 16.6%;float: left;color: grey;">
					<div style="width: 100%;height: 90px;text-align: center;"><img width="80px" alt="" src="static/image/cart-icon.jpg"> </div>
					<div style="width: 100%;text-align: center;">1.Order the epiaging kit</div>
					<div style="width: 100%;text-align: center;">online or through our app</div>
				</div>
				<div style="width: 16.6%;float: left;color: grey;">
					<div style="width: 100%;height: 90px;text-align: center;"><img width="80px" alt="" src="static/image/tube-icon.jpg"> </div>
					<div style="width: 100%;text-align: center;">2.Collect your</div>
					<div style="width: 100%;text-align: center;">saliva sample</div>
				</div>
				<div style="width: 16.6%;float: left;color: grey;">
					<div style="width: 100%;height: 90px;text-align: center;"><img width="80px" alt="" src="static/image/book-icon.jpg"> </div>
					<div style="width: 100%;text-align: center;">3.Fill out quetsion-</div>
					<div style="width: 100%;text-align: center;">naire (Option)</div>
				</div>
				<div style="width: 16.6%;float: left;color: grey;">
					<div style="width: 100%;height: 90px;text-align: center;"><img width="80px" alt="" src="static/image/micro-icon.jpg"> </div>
					<div style="width: 100%;text-align: center;">4.DNA extraction</div>
					<div style="width: 100%;text-align: center;">and analysis</div>
				</div>
				<div style="width: 16.6%;float: left;color: grey;">
					<div style="width: 100%;height: 90px;text-align: center;"><img width="80px" alt="" src="static/image/letter-icon.jpg"> </div>
					<div style="width: 100%;text-align: center;">5.View the report</div>
					<div style="width: 100%;text-align: center;">through the App</div>
				</div>
				<div style="width: 16.6%;float: left;color: grey;">
					<div style="width: 100%;height: 90px;text-align: center;"><img width="80px" alt="" src="static/image/love-icon.jpg"> </div>
					<div style="width: 100%;text-align: center;">6.Make lifestyle changs,</div>
					<div style="width: 100%;text-align: center;">impove your health</div>
				</div>
			</div>
		</div>
		<div style="width: 100%;height: auto;">
                	<div style="float: left;width: 60%;height: 434px;background-color: rgb(24,156,160)">
                		<div style="width: 100%;height:60px;"></div>
                		<div style="width: 100%;height: 80%;color: white;">
                			<div style="width: 30%;height:  100%;float: left;"></div>
                			<div style="width: 40%;height:  100%;float: left;">
                				<div style="width: 100%;height: 30px;text-align: left;font-size: 20px;">Take Charge Of Your Life</div>
                				 <div style="width: 100%;height: 20px;"></div>
                				 <div style="width: 100%;height: 180px;text-align: left;font-size: 16px;color: #efefef;">Research has uncovered another ground-breaking discovery: environment and lifestyle choices may also affect your health and biological age. Smoking, diet, drugs, exercise, stress, etc., are factors that may alter the genetic code of, not only you, but of your children and grand-children, as well. But knowledge is, indeed, golden. Knowing your true age and associated risks, gives you the opportunity to change them!</div>
                				<div style="width: 100%;height: 20px;"></div>
                				<div style="width: 100%;background-color: white;height: 1px;"></div>
                				 <div style="width: 100%;height: 10px;"></div>
                				  <div style="width: 25%;height: 40px;border-radius:20px ;text-align: center;line-height: 40px;color: white;background-color: rgb(240,90,37);">Buy now</div>
                			</div>
                			<div style="width: 30%;height: 80%;float: left;"></div>
                		</div>
                	</div>
                	<div style="float: left;width: 40%;height: 434px;;background-color:#f1f2f6;text-align: center;">
                		<div style="width: 100%;height: 80px;"></div>
                		<img   height="300px"  src="static/image/dna-meth-big.jpg">
                	</div>
            </div>
            <div style="clear: both;"></div>
            <div style="width: 100%;height: 400px;background-color: rgb(35,35,35);">
            	<div style="float: left;width: 10%;height: 400px;"></div>
            	<div style="float: left;width: 20%;height: 400px;color: grey;">
            		<div style="width: 100%;height: 20px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">HKG Epitherapeutics</div>
            		<div style="width: 100%;height: 15px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">A Hong Kong company, dedicated to harnessing the untapped power and possibilities of Epigenetics.</div>
            		<div style="width: 100%;height: 150px;"></div>
            		<div style="width: 100%;height: 100px"><img width="153px"  src="static/image/back-logo.jpg"> </div>
            	</div>
            	<div style="float: left;width: 15%;height: 400px;color: grey;">
            		<div style="width: 100%;height: 20px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">CONTACT US</div>
            		<div style="width: 100%;height: 15px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">TOLL FREE:</div>
            		<div style="width: 100%;height: 15px;">+1 844-384-4564</div>
            		<div style="width: 100%;height: 50px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">EMAIL:</div>
            		<div style="width: 100%;height: 15px;">info@epi-age.com</div>
            		<div style="width: 100%;height: 50px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">ADDRESS:</div>
            		<div style="width: 100%;height: 15px;">HKG epiTherapeutics Limited Unit 613, 6/F Biotech Centre 211 Science Park West Avenue Hong Kong Science Park Shatin, N.T., Hong Kong</div>
            		<div style="width: 100%;height: 50px;"></div>
            	</div>
            	<div style="float: left;width: 15%;height: 400px;color: grey;">
            		<div style="width: 100%;height: 20px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">PRODUCTS</div>
            		<div style="width: 100%;height: 15px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">epiAge products</div>
            		<div style="width: 100%;height: 15px;"><span style="text-decoration: line-through;color: rgb(247,147,0);">$249.99</span>&nbsp;&nbsp;<span style="color: rgb(33,189,202) ">$145</span></div>
            		<div style="width: 100%;height: 20px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">epiSame products</div>
            		<div style="width: 100%;height: 15px;"><span style="text-decoration: line-through;color: rgb(247,147,0);">$55.0</span>&nbsp;&nbsp;<span style="color: rgb(33,189,202) ">$42</span></div>
            		 <div style="width: 100%;height: 20px;"></div>
            		<div style="width: 100%;height: 70px;"><img  src="static/image/google-paly.png"> </div>
            		<div style="width: 100%;height: 70px;"><img  src="static/image/app-store.png"> </div>
            	</div>
            		<div style="float: left;width: 15%;height: 400px;color: grey;">
            		<div style="width: 100%;height: 20px;"></div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">HELP</div>
            		<div style="width: 100%;height: 15px;"></div>
            		<div style="width: 100%;height: 20px;">About</div>
            		<div style="width: 100%;height: 20px;">How Does It Work?</div>
            		<div style="width: 100%;height: 20px;">FAQ</div>
            		<div style="width: 100%;height: 20px;font-size: 14px;">Contact Us</div>
            	</div>
            </div>
           <div style="clear: both;"></div>
            <div style="width: 100%;height: 50px;background-color: #444444;">
            	 <div style="width: 40%;height: 100%;float: left;line-height: 50px;color: grey;text-align: center;">© 2019 Epi Age. All rights reserved. Designed by Swan Media</div>
            	 <div style="width: 60%;height: 100%;float: left;line-height: 50px;text-align: center;">
            	 	<a href="#" style="color: grey;text-decoration: none;">TERMS & CONDITIONS</a>&nbsp;&nbsp;
            	 	<a href="#"  style="color: grey;text-decoration: none;">PRIVACY POLICY</a>&nbsp;&nbsp;
            	 	<a href="#"  style="color: grey;text-decoration: none;">REFUND POLICY</a>&nbsp;&nbsp;
            	 	<a href="#"  style="color: grey;text-decoration: none;">DISCLAIMER</a>
            	 </div>
            </div>
	</div>
</body>

</html>