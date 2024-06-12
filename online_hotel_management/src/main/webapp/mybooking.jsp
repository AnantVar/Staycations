<%@page import="java.util.Map"%>
<%@page import="online_hotel_management.dto.Hotel"%>
<%@page import="java.util.HashMap"%>
<%@page import="online_hotel_management.dto.Customer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myBooking.css">
</head>
<body>

	<%
	Customer customer = (Customer) session.getAttribute("customersession");

	HashMap<Hotel, Integer> bookedHotels = (HashMap) session.getAttribute("bookedhotels");
	
	HashMap<Hotel, Integer> newBookedHotels =(HashMap) session.getAttribute("newbookedhotels");
	if(newBookedHotels!=null){
		bookedHotels=newBookedHotels;
	}
	%>



	<section id="popular-product">
    <div class="product-container">
        <div class="product-box">
            <div class="container">
                <div class="rightbox">
                   
                    <div class="Payment tabShow">
                     <%
                    for (Map.Entry<Hotel, Integer> entry : bookedHotels.entrySet()) {
                        Hotel bookedHotel = entry.getKey();
                        Integer numberOfRooms = entry.getValue();
                    %>
                        <h1>My Bookings</h1>
                        <h2>Hotel Name</h2>
                        <input type="text" class="input" value="<%=bookedHotel.getHotelName()%>">
                        <h2>Phone</h2>
                        <input type="text" class="input" value="<%=bookedHotel.getHotelPhone()%>">
                        <h2>Email</h2>
                        <input type="number" class="input" value="<%=bookedHotel.getHotelEmail()%>">
                        <h2>Room price</h2>
                        <input type="number" class="input" value="<%=bookedHotel.getRoomPrice()%>">
                        <form action="cancellingservlet" method="post">
                            <input type="hidden" name="hotelId" value="<%=bookedHotel.getHotelId()%>">
                            <input type="hidden" name="customerId" value="<%=customer.getCustomerId()%>">
                            <h2>No of rooms</h2>
                            <input type="number" name="noOfRooms" placeholder="Enter no of rooms to cancel" min="1" max="100" required>
                            <button type="submit" value="CancelBooking">Cancel</button>
                        </form>
                        <% } %>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>



</body>
</html>


