<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.2/dist/umd/popper.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/js/tempus-dominus.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/gh/Eonasdan/tempus-dominus@master/dist/css/tempus-dominus.css" rel="stylesheet" crossorigin="anonymous">
<style>
    .tempus-dominus-widget.light .date-container-decades div:not(.no-highlight).active, .tempus-dominus-widget.light .date-container-years div:not(.no-highlight).active, .tempus-dominus-widget.light .date-container-months div:not(.no-highlight).active, .tempus-dominus-widget.light .date-container-days div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-clock div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-hour div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-minute div:not(.no-highlight).active, .tempus-dominus-widget.light .time-container-second div:not(.no-highlight).active {
    background-color: #FFD34A;
    color: black;
    text-shadow: 0 -1px 0 rgb(0 0 0 / 25%);
}
.tempus-dominus-widget.light button {
    background-color: #FFD34A;
    color: black;
    border-color: #FFD34A;
}
.tempus-dominus-widget.light .date-container-decades div:not(.no-highlight).today:before, .tempus-dominus-widget.light .date-container-years div:not(.no-highlight).today:before, .tempus-dominus-widget.light .date-container-months div:not(.no-highlight).today:before, .tempus-dominus-widget.light .date-container-days div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-clock div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-hour div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-minute div:not(.no-highlight).today:before, .tempus-dominus-widget.light .time-container-second div:not(.no-highlight).today:before {
    border-bottom-color: #FFD34A;
    border-top-color: rgba(0, 0, 0, 0.2);
}
</style>
<jsp:include page="../layout/header.jsp"></jsp:include>
<section>
    <div class="outerBox">
    	<form action="/schedule/register" method="post">
    		<input type="hidden" name="grno" value="${grno }">
	        <div class='input-group' id='datetimepicker1' data-td-target-input='nearest' data-td-target-toggle='nearest'>
	            <input id='datetimepicker1Input' name="meetdate" type='text' class='form-control' data-td-target='#datetimepicker1'/>
	            <span class='input-group-text' data-td-target='#datetimepicker1' data-td-toggle='datetimepicker'>
	                <span class='fa-solid fa-calendar'></span>
	            </span>
	        </div>
	        <span>제목: </span><input type="text" name="title" id="schTitle"><br>
            <span>장소: </span><input type="text" name="spot" id="schSpot"><br>
            <span>비용: </span><input type="text" name="cost" id="schCost" placeholder="ex- 나중에 정산/무료"><br>
            <span>최대 인원: </span><input type="number" name="max_member" id="schMax_member" min="2" value="2"><br>
            <button type="submit">스케줄 생성</button>
        </form>
 </div>
</section>
<script type="text/javascript">
const today=new Date();
new tempusDominus.TempusDominus(document.getElementById('datetimepicker1'), {
    display: { 
        components: {
            seconds: false,
            useTwentyfourHour: false,
        },
        icons: {
            type: 'icons',
            time: 'fa fa-solid fa-clock',
            date: 'fa fa-solid fa-calendar',
            up: 'fa fa-solid fa-arrow-up',
            down: 'fa fa-solid fa-arrow-down',
            previous: 'fa fa-solid fa-chevron-left',
            next: 'fa fa-solid fa-chevron-right',
            today: 'fa fa-solid fa-calendar-check',
            clear: 'fa fa-solid fa-trash',
            close: 'fas fa-solid fa-xmark'
        },
    },
    restrictions: {
        minDate: today,
      },
});
const schMsg='<c:out value="${schMsg }"/>';
if(schMsg==="0"){
	alert("빈 칸을 모두 채워주세요!");
}
</script>
<jsp:include page="../layout/footer.jsp"></jsp:include>