<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<title>Flyp IMS</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/flyp-ims.css" type="text/css">
</head>

<body bgcolor="#ffffff" text="#000000" onLoad="page_onload()">
	<table width="100%" height="100%" border="0" cellspacing="0"
		cellpadding="0">
		<tbody>
			<!-- Header row -->
			<tr height="40">
				<td colspan="3">
					<table width="100%" height="40" border="0" cellspacing="0"
						cellpadding="0">
						<tbody>
							<tr>
								<td width="531" bgcolor="E6E7E8">
									<!-- header color -->
									<div align="left" class="titleHead header">
										<a href="http://www.getflyp.com/"><img
											src="images/flyp_logo_horiz.png"
											style="width: 173px; height: 70px"> </img></a>
									</div>
								</td>
								<td bgcolor="#880000" halign="center" valign="center"
									width="234">
									<div align="center" class="titleHead header">
										<b>Flyp IMS</b>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<!-- horiz line -->
			<tr>
				<td colspan="2" height="5" bgcolor="#ffffff"><br></td>
			</tr>
			<tr>
				<!-- Menu -->
				<td bgcolor="#8a0a0a" valign="top" width="180">
					<table cols="2" rows="1" border="0" cellspacing="0" cellpadding="0"
						width="100%" height="100%">
						<tbody>
							<tr>
								<td valign="top">
									<table cols="1" rows="1" border="0" cellspacing="0"
										cellpadding="0" width="100%">
										<tbody>
											<tr>
												<td>
													<div class="menuHead">
														<a href="index.jsp" class="menuItem"> User
															Accounts</a>
													</div>
												</td>
											</tr>
											<tr>
												<td>
													<div class="menuHead">
														<a href="customer.jsp" class="menuItem">Customer/Marketing</a>
													</div>
												</td>
											</tr>
											<tr>
												<td><div class="menuHead">
														<a href="administrative.jsp" class="menuItem">Administrative</a>
													</div></td>
											</tr>
										</tbody>
									</table>
								</td>
								<td width="3" bgcolor="#8a0a0a"><br></td>
							</tr>
						</tbody>
					</table>
				</td>
				<!-- End Menu -->
				<td colspan="2">
					<table border="0" cellspacing="0" cellpadding="0" width="100%"
						height="100%">
						<tbody>

							<tr>
								<td style="padding: 10px;" valign="top" align="left">
									<!-- -------------------- --> <!-- Begin Page Content --> 
									<sql:setDataSource
										var="snapshot" driver="com.mysql.jdbc.Driver"
										url="jdbc:mysql://localhost:3306/flypapp" user="root"
										password="" /> 
										
									<sql:query dataSource="${snapshot}" var="result">
										select u.id,
										concat(u.number, '') native_number,
										u.device_token,
										u.email,
										u.pin,
										u.auth_token,
										u.platform,
										concat(u.name, '') as user_name,
										concat(u.created_ts, '') users_created_ts,
										concat(p.id, '') as persona_id,
										p.user_id,
										concat(p.number, '') flyp_number,
										p.status,
										concat(p.name, '') persona_name,
										p.image,
										p.type,
										concat(p.created_ts, '') personas_created_ts,
										p.service,
										p.sku,
										p.subscription_id,
										p.expiration_date,
										p.plan_id,
										p.in_sms_actual,
										p.out_sms_actual,
										p.in_minutes_actual,
										p.out_minutes_actual
										  from users u, personas p
										where p.user_id = u.id
										  and ifnull(u.number,'') like '%<%=request.getParameter("phonenumber") %>%'
										  and ifnull(p.number,'') like '%<%=request.getParameter("flypnumber") %>%'
										  and ifnull(p.name,'') like '%<%=request.getParameter("flypname") %>%'
										  and ifnull(u.email,'') like '%<%=request.getParameter("email") %>%';
										  
									</sql:query>
									
									<table border="1" width="100%">
										<tr>
										   <th>Persona ID</th>
										   <th>Phone Number</th>
										   <th>Flyp Number</th>
										   <th>Name of Flyp Number</th>
										   <th>Platform</th>
										   <th>Email</th>
										   <th>Persona Created</th>
										   <th>User Created</th>
										   <th>In SMS</th>
										   <th>Out SMS</th>
										   <th>In Minutes</th>
										   <th>Out Minutes</th>
										</tr>
										<c:forEach var="row" items="${result.rows}">
										<tr>
										   <td><a href="user.jsp?id=${row.persona_id}"><c:out value="${row.persona_id}"/></a></td>
										   <td><c:out value="${row.native_number}"/></td>
										   <td><c:out value="${row.flyp_number}"/></td>
										   <td><c:out value="${row.persona_name}"/></td>
										   <td><c:out value="${row.platform}"/></td>
										   <td><c:out value="${row.email}"/></td>
										   <td><c:out value="${row.personas_created_ts}"/></td>
										   <td><c:out value="${row.users_created_ts}"/></td>
										   <td><c:out value="${row.in_sms_actual}"/></td>
										   <td><c:out value="${row.out_sms_actual}"/></td>
										   <td><c:out value="${row.in_minutes_actual}"/></td>
										   <td><c:out value="${row.out_minutes_actual}"/></td>
										</tr>
										</c:forEach>
									</table>
	
									<!-- ---------------------------- -->
									<%
										String phoneNumber = request.getParameter("phonenumber");
										String flypNumber = request.getParameter("flypnumber");
										String flypName = request.getParameter("flypname");
										String email = request.getParameter("email");
									%>
									<ul>
									<li><p><b>Phone Number:</b>
									   <%= phoneNumber%>
									</p></li>
									<li><p><b>Flyp Number:</b>
									   <%= flypNumber%>
									</p></li>
									<li><p><b>Name of Flyp Number:</b>
									   <%= flypName%>
									</p></li>
										<li><p>
												<b>Email Address:</b>
												
												<a href="user.jsp?id=<%=phoneNumber%>"><%=email%></a>
											</p></li>
									</ul>
									
									
										
										<!--  End Page Content  -->
										<!-- ------------------ -->
								</td>
							</tr>
							<tr bgcolor="#E6E7E8" height="20">
								<td
									style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">

									<p>
										<font style="font-size: 12px;"> &copy 2015 Flyp, Inc.
										</font>
									</p>

									<p>
										<font style="font-size: 12px;"> <b></b>

										</font>
									</p>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</body>
</html>


