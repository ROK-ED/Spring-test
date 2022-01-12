<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="home">
	<div class="home_background parallax-window" data-parallax="scroll"
		data-image-src="resources/images/reservation_background.jpg"></div>
	<div class="home_content">
		<div class="home_title">reservation</div>
	</div>
</div>

<div class="contact_form_section">
	<div class="container-fluid">
		<div class="row">
			<div class="col">
				<div class="container-fluid">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>RESERVATION_ID</th>
								<th>RESERVATION_PLACE</th>
								<th>RESERVATION_MEMBER_EMAIL</th>
								<th>RESERVATION_TIME</th>
								<th>RESERVATION_DATE</th>
								<th>RESERVATION_STATE</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${reservationList}" var="reservation">
								<tr>
									<c:choose>
										<c:when test="${reservation.reservation_option == 'F'}">
											<td>FOOD</td>
										</c:when>
										<c:when test="${reservation.reservation_option == 'H'}">
											<td>HOTEL</td>
										</c:when>
										<c:when test="${reservation.reservation_option == 'P'}">
											<td>PLACE</td>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${not empty reservation.hotel_title}">
											<td>${reservation.hotel_title }</td>
										</c:when>
										<c:when test="${not empty reservation.place_name}">
											<td>${reservation.place_name }</td>
										</c:when>
										<c:when test="${not empty reservation.food_name}">
											<td>${reservation.food_name }</td>
										</c:when>
										<c:otherwise>
											<td>empty</td>
										</c:otherwise>
									</c:choose>
									<td>${reservation.reservation_member_email }</td>
									<td>${reservation.reservation_time }</td>
									<td><fmt:formatDate
											value="${reservation.reservation_date }"
											pattern="yyyy-MM-dd hh:mm" /></td>
									<td>
										<div class="btn-group" role="group">
											<button id="btnGroupDrop1" type="button"
												<c:if test="${reservation.reservation_state eq '예약대기'}">
													class="btn btn-warning dropdown-toggle"
												</c:if>
												<c:if test="${reservation.reservation_state eq '예약성공'}">
													class="btn btn-success dropdown-toggle"
												</c:if>
												<c:if test="${reservation.reservation_state eq '예약취소'}">
													class="btn btn-danger dropdown-toggle"
												</c:if>
												<c:if test="${sessionScope.member_author == 'USER'}">
													disabled="disabled"
												</c:if>
												data-toggle="dropdown" aria-haspopup="true"
												aria-expanded="false">${reservation.reservation_state }</button>
											<div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
												<a class="dropdown-item"
													href="chaingeReservation.do?cmd=stand&reservation_id=${reservation.reservation_id}"><button
														type="button" class="btn btn-warning">예약대기</button></a> <a
													class="dropdown-item"
													href="chaingeReservation.do?cmd=success&reservation_id=${reservation.reservation_id}"><button
														type="button" class="btn btn-success">예약성공</button></a> <a
													class="dropdown-item"
													href="chaingeReservation.do?cmd=cancel&reservation_id=${reservation.reservation_id}"><button
														type="button" class="btn btn-danger">예약취소</button></a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>