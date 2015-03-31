<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
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
									<%
										String persona_id = request.getParameter("id");
									%>
									
									<%= persona_id %>
									<form>
										Change number to:<br> <input type="text"
											name="newnumber"> <br> <button name="newNumber">Submit</button> <br>
											<button name="deletePersona">Delete this Persona</button> <br>
									</form>
									
									<!--  End Page Content  -->
									<!-- ------------------ -->

								</td>
							</tr>
							<tr bgcolor="#E6E7E8" height="20">
								<td
									style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">

									<p>
										<font style="font-size: 12px;"> &copy 2015 Flyp, Inc.</span>
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


