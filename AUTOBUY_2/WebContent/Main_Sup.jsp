<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<head>>
<style>
	.container{
	border:1px solid black;
	width:1400px;
	}
	.header{
	float:left;
	width:1400px;
	height:84px;	
	border-bottom:1px solid black;
	}
	.title{
	width:25%;
	height:6%;
	}
	.header p{
	width:300px;
	height:64px;
	font-size:50px;
	color:blue;
	margin-left:30px;
	margin-top:5px;
	}
	.mypage{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.logout{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.store_name{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.list{
	float:left;
	width:280px;
	height:1232px;
	border-right: 1px solid black;
	}
	.list_common{
	width:80%;
	height:8%;
	float:left;
	margin:21.5px;
	background-color: #bdf;
  	border:2px solid #1bf;
  	border-radius: 15px;
	}
	.list p {
   	width:180px;
   	margin:0 auto;
   	margin-top:25px;
   	text-align:center;
   	font-size:28px;
    }
	.content{
	float:left;
	width:1118px;
	height:1232px;
	}
	.small_title{
	height:64px;
   	font-size:28px;
   	margin-left:50px;
   	margin-right:50px;
	}
	.small_title p{
	width:500px;
	margin-right:30px;
	}
	.add{
	float:right;
	font-size:25px;
	margin-right:30px;
	margin-top:12px;
	}
	.footer{
	clear:both;
	width:1400px;
	height:84px;
	border-top: 1px solid black;
	}
	.banner {
	font-size:40px;
	width:15%;
	float:left;
	margin-top:12px;
	margin-left:35px;
	}
	.company{
	font-size:18px;
	width:50%;
	float:left;
	margin-top:3px;
	line-height:27px;
	}
	.list_board{
	margin-top:30px;
	float:top;
	width:1018px;
	text-align:center;
	font-size:20px;
	}
	.board{
	border-top:1px solid black;
	margin-top:40px;
	margin-left:50px;
   	margin-right:50px;
	}
	.small{
	font-size:10px;
	}
	.search{
	float:left;
	margin-left:50px;
	margin-bottom:15px;
	margin-right:15px;
	}
	.sub{
	float:left;

	}
	.term{
	float:left;
	margin-left:180px;
	}
	.term p{
	float:left;}
	</style>
</head>
<body> 
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
	%>
	<div class="container" >
		<div class="header">
			<div class="title"><p>AUTOBUY</p></div>
			<%if(info != null){%>
				<div class="store_name">
					<h4><%= info.getCustomer_id() %>님<h4>
				</div>
			<%} %>
			<div class="logout"><a href="LogoutServiceCon">로그아웃</a></div>
			<div class="mypage"><a href="UpdateServiceCon">마이페이지</a></div>			
		</div>
		<div class="list">
			<div class="list_1 list_common"><p><a href="Main_Sup.jsp">출고</a></p></div>
			<div class="list_2 list_common"><p><a href="#">고객관리</a></p></div>
			<div class="list_3 list_common"><p><a href="#">제품 등록</a></p></div>
		</div>
		<div class="content">
			<div class="small_title"><p>출고</p></div>
				<form><div class="search"><img src="img/search.png" height="35px" width="35px" >   <input type="text" name="Searching"> <input type="submit" value="검색"></div></form>
			<div class="sup">거래처
					<select name="sub_search" class="sub_search" >
						<option value="선택">선택</option>
				    	<option value="언즈유통">언즈유통</option>
				   		<option value="니니언즈유통">니니언즈유통</option>
		 			</select>
		 	</div>
		 	<div class="term">기간별                     
		 		시작일 : <input type="date" value="start" min="yyy" max="zzz">
		 		
		 		종료일 : <input type="date" value="end" min="yyy" max="zzz">
		 	</div>
			<div class="board">
				<table class="list_board">
					<tr>
						<td>주문번호</td>
						<td>카페상호</td>
						<td>발주일</td>
						<td>출고현황<br><p class="small">(납품 예정/확인/완료)</p></td>
						<td>주문상세</td>
					</tr>
					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><button ><a href="Order_details.jsp">주문상세</a></button></td>
					</tr>		
			 </table>
			</div>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 / 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>
	</div>

</body>
</html>