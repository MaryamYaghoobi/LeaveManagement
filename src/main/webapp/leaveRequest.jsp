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
  <title>درخواست مرخصی</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link href='css/normalize.css' rel='stylesheet' />
    <link href='css/fontawesome/css/font-awesome.min.css' rel='stylesheet' />
    <link href="css/vertical-responsive-menu.min.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link href="css/prism.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/persianDatepicker-default.css" />
	<link rel="stylesheet" href="css/chung-timepicker.css">


    <jsp:include page="employeeHeader.jsp"/>
</head>
<body dir="rtl">
<jsp:include page="body.jsp"/>

<c:if test="${requestScope['LeaveIsNotValid'] =='validLeaveRequest'}">
    <div style="width: 450px;border-radius: 5px; margin: 10px auto;">
        <div class="alert alert-success" id="success-alert" style="background-color: #F0DCAC;border: none;">
            <button type="button" class="close" data-dismiss="alert">x</button>
            <strong>درخواست با موفقیت ثبت شد.
            </strong>
        </div>
    </div>
</c:if>


<div class="container" name="container"
     style="background-color: #F0E1BE; width: 700px; margin-top: 55px;border-radius: 5px;">
    <form action="EmployeeController" id="leaveRequestForm" method="post" onsubmit="return dateCheck()">
        <input type="hidden" name="action" value="leaveRequest">
		 <label>درخواست مرخصی</label>
        <div class="form-row">
	
            <div class="form-group col-md-6" style="margin-top: 17px;">
                <label><label style="color: #ff4626">*</label>
                    از تاریخ</label>
                <input type="text"  class="form-control" id="leaveFromDate" name="leaveFromDate">
            </div>
            <div class="form-group col-md-6" style="margin-top: 17px;">
                <label><label style="color: #ff4626">*</label>
                    تا تاریخ</label>
                <input type="text"  class="form-control" id="leaveToDate" name="leaveToDate">			
            </div>
        </div>
		<div class="form-row">
	
            <div class="form-group col-md-6" style="margin-top: 17px;">
                <label><label style="color: #ff4626"></label>
                 از ساعت</label>
                <input type="text"  class="form-control" id="leaveFromTime" name="leaveFromTime">
            </div>
            <div class="form-group col-md-6" style="margin-top: 17px;">
                <label><label style="color: #ff4626"></label>
                    تا ساعت</label>
                <input type="text"  class="form-control" id="leaveToTime" name="leaveToTime">			
            </div>
        </div>
		 <div class="form-group col-md-15" style="margin-top: 17px;">
               
 <label> دلیل :</label>
                <input type="text" class="form-control" id="reason" name="reason">
            </div>
        <div class="form-row" dir="rtl">
            <div class="col-md-3" style="margin-top: 17px;margin-bottom: 10px;">
                <button type="submit" class="btn btn-primary" style="background-color: #F4C34E;border: none;">
                    ذخیره مرخصی
                </button>
            </div>
        </div>
    </form>
</div>
<!--===============================================================================-->	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!--===============================================================================-->	
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>	
<!--=================================================================================-->	
    <script src="js/persianDatepicker.min.js"></script>
<!--=================================================================================-->		
    <script src="js/vertical-responsive-menu.min.js"></script>
<!--=================================================================================-->
<script src="js/chung-timepicker.js"></script>
<!--=================================================================================-->

    <script>

        function dateCheck() {
            var leaveFromDate = new Date($('#leaveFromDate').val());
            var leaveToDate = new Date($('#leaveToDate').val());
            if (document.forms["leaveRequestForm"]["leaveFromDate"].value == null 
			|| document.forms["leaveRequestForm"]["leaveFromDate"].value === "") {
                window.alert("تاریخ شروع مرخصی نمیتواند خالی باشد.");
                return false;
            }
            if (document.forms["leaveRequestForm"]["leaveToDate"].value == null ||
			document.forms["leaveRequestForm"]["leaveToDate"].value === "") {
                window.alert("تاریخ پایان مرخصی نمیتواند خالی باشد.");
                return false;
            }
            if (Date.parse(leaveFromDate) > Date.parse(leaveToDate)) {
                window.alert("تاریخ شروع بعد از تاریخ پایان است.");
                return false;
            }
        }
    </script>
<!--=================================================================================-->			
<script type="text/javascript">

    $(function() {
        $("#leaveFromDate").persianDatepicker();   
    });
</script>

<script type="text/javascript">
    $(function() {
        $("#leaveToDate").persianDatepicker();
       
    });
</script>
<script type="text/javascript">
    $(function() {
		debugger;
	var x =  $("#leaveFromTime")
       $('#leaveFromTime').chungTimePicker();
       
    });
</script>
<script type="text/javascript">
    $(function() {
       $('#leaveToTime').chungTimePicker();
       
    });
</script>	

</body>
</html>
