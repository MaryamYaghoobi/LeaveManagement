<%--
  Created by IntelliJ IDEA.
  User: M.yaghoobi
  Date: 28/2/2021
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
<title>پیام های دریافتی</title>
<!--===============================================================================================-->	
<link rel="stylesheet" href="https://cdn.rtlcss.com/bootstrap/v4.2.1/css/bootstrap.min.css" 
integrity="sha384-vus3nQHTD+5mpDiZ4rkEPlnkcyTP+49BhJ4wJeJunw06ZAp+wzzeBPUXr42fi8If" crossorigin="anonymous">
<!--===============================================================================================-->				
    <jsp:include page="employeeHeader.jsp"/>
</head>
<body dir="rtl">
<jsp:include page="body.jsp"/>
<c:choose>
<c:when test="${empty requestScope.ReceiveMessages}">
    <div style="width: 400px;border-radius: 5px; margin: 10px auto;text-align: center;">
        <div class="alert alert-info" id="info-alert"  style="border: none;background-color: #F0E1BE;">
            <button type="button" class="close" data-dismiss="alert"></button>
            <strong> پیام جدیدی ارسال نشده است.</strong>

        </div>
    </div>
</c:when>
<c:otherwise>
<div class="container" style="margin-top: 50px;border-radius: 6px;background-color: #F0E1BE;"><br>
    <span style="font-weight: bold;font-size: 17px;color:darkblue"><h>لیست پیام های دریافت شده</h></span><br><br>
    <table class="table table-bordered table-hover table-responsive-lg">
        <thead class="thead-light ">
        <tr style="border-radius: 10px;">

            <th class="text-center" scope="col" style="background-color:#F4C34E;">نام ارسال کننده</th>
            <th class="text-center" scope="col" style="background-color:#F4C34E;">نام خانوادگی ارسال کننده</th>
			<th class="text-center" scope="col" style="background-color:#F4C34E;">عنوان</th>
            <th class="text-center" scope="col" style="background-color:#F4C34E;">متن پیام دریافت شده</th>
            <th class="text-center" scope="col" style="background-color:#F4C34E;">فایل پیوست</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.ReceiveMessages}" var="messagesReceived">
            <tr>
                <td hidden><c:out value="${messagesReceived[0]}"/></td>
                <td><c:out value="${messagesReceived[1]}"/></td>
                <td><c:out value="${messagesReceived[2]}"/></td>
                <td><c:out value="${messagesReceived[3]}"/></td>
                <td><c:out value="${messagesReceived[4]}"/></td>
                <td>
                    <c:choose>
                        <c:when test="${empty messagesReceived[5]}">
                            <span>فایلی پیوست نشده است.</span>
                        </c:when>
                        <c:otherwise>
                            <button type="button" class="btn btn-primary btn-lm my-0 badge-pill"
                                    style="width: 110px; border-radius: 7px; align-self: center;"
                                    onclick="downloadAttachment('${messagesReceived[5]}')">دریافت فایل
                            </button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    </c:otherwise>
    </c:choose>
</div>
<!--===============================================================================================================================-->	
<script>function downloadAttachment(fileName) {window.location = 'EmployeeController?action=downloadAttachment&fileName=' + fileName; }</script>   
<!--================================================================================================================================-->		
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<!--================================================================================================================================-->		
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<!--================================================================================================================================-->		
</body>
</html>
