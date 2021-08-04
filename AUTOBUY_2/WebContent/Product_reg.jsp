<%@page import="auto.model.CartDTO"%>
<%@page import="auto.model.OrderDAO"%>
<%@page import="auto.model.StockDAO"%>
<%@page import="auto.model.StockDTO"%>
<%@page import="auto.model.ProductDTO"%>
<%@page import="auto.model.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="auto.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<link rel="stylesheet" href="assest/css/StockAdd.css">
</head>
<body>
	<%
		MemberDTO info = (MemberDTO)session.getAttribute("info");
		String customer_id = info.getCustomer_id();
	
		ProductDAO product_dao = new ProductDAO();

		ArrayList<ProductDTO> product_list = new ArrayList<ProductDTO>();
		product_list = product_dao.showProduct();
		
		
		
		OrderDAO order_dao = new OrderDAO();		
		ArrayList<CartDTO> cart_list = order_dao.showCart(customer_id);		
		
		for(int i=0; i<product_list.size(); i++){
			for(int j=0; j<cart_list.size(); j++){
				if(product_list.get(i).getProduct_num()==cart_list.get(j).getProduct_num()){
					product_list.remove(i);
					i=0;
				}
			}
		}
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
			<div class="mypage"><a href="Update.jsp"><img src="img/mypage.png" height="40px" width="40px"></a></div>			
		</div>
		<div class="list">
			<div class="small_list">
				<div class="main_p"><p><a href="Main.jsp"><img src="img/list_i.png" height="30px" width="30px">제품목록</a></p></div>
				<div class="incoming"><p><a href="Incoming.jsp"><img src="img/in.png" height="30px" width="30px">입고</a></p></div>
				<div class="outgoing"><p><a href="Outgoing.jsp"><img src="img/out.png" height="30px" width="30px">출고</a></p></div>
				<div class="shelf"><p><a href="Shelf_life.jsp"><img src="img/shelf.png" height="30px" width="30px">유통기한 관리</a></p></div>
				<div class="sup_con"><p><a href="Sup_con.jsp"><img src="img/sup.png" height="30px" width="30px">거래처 관리</a></p></div>
				<div class="data"><p><a href="Data.jsp"><img src="img/chart.png" height="30px" width="30px">대시보드</a></p></div>
				<div class="limit"><p><a href="Limit.jsp"><img src="img/li.png" height="30px" width="30px">조정</a></p></div>
				<div class="product"><p><a href="Product_reg.jsp"><img src="img/product.png" height="30px" width="30px">수동발주</a></p></div>
			</div>
		</div>
		<div class="content">
			<div class="small_title"><p>상품주문</p></div>
				<div class="board">
           		<table class="list_board" style="width: 500px">
					<tr>
						<td >제품명</td>
						<td >가격</td>
						<td>거래처</td>
						<td>등록</td>
					</tr>
					<%for(int i = 0; i<product_list.size();i++){ %>
					<tr>
						<td style = "width:25%"><%=product_list.get(i).getProduct_name() %></td>
						<td style = "width:25%"><%=product_list.get(i).getProduct_price() %>원</td>
						<td style = "width:25%"><%=product_list.get(i).getSupplier_name() %></td>
						<td style = "width:25%"><a href="CartServiceCon?product_num=<%=product_list.get(i).getProduct_num()%>"><input type="button" value ="추가"></a></td>
					</tr>
					<%} %>

				</table>                                                                                                                        
				
			</div>
			<form action="ManualOrderServiceCon" method="post">
			<div class="board2">
			
            <table class="list_board2">
               <tr>
                  <td>제품명</td>
                  <td>거래처</td>
                  <td>수량</td>
                  <td>삭제</td>
               </tr>
 			   
               <%for(int i=0; i<cart_list.size(); i++){ %>
					<tr>
						<td><%=cart_list.get(i).getProduct_name() %></td>
						<td><%=cart_list.get(i).getSupplier_name() %></td>
						<td><input type="number"  name = "order_qntty" min="0" value=0 size="10px" style="width:50px;"></td>
						<td><a href="CartDeleteServiceCon?product_num=<%=cart_list.get(i).getProduct_num()%>"><input type="button" value ="삭제"></a></td>				
					</tr>
				<%} %>
				
				<tr>
					<td colspan="4" align="right"><input type="submit" value="발주" ></td>
				</tr>
            </table>
            
        	</div>		
        	<div></div>	
        	</form>
		</div>
		<div class ="footer">
			<div class="banner">AUTOBUY</div>
			<div class="company">주)오도바이절<br>
								대표 : 송김정정 | 사업자 등록 번호 : 000-00-00000<br>
								광주광역시 남구 송암로60 광주CGI센터</div>
		</div>
	</div>

</body>
</html>