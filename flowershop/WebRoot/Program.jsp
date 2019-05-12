<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"></jsp:include>
<div style=" min-width: 1400px; min-height:200px; padding:20px 100px;" id="feedback">
	<script type="text/javascript">
$(document).ready(function () {
		/* $.post(
				"${pageContext.request.contextPath }/admin_findprolist.action",
				function (data){
					$(data).each(function (i,data) {
						$("#productlist").append("<option value='"+data.id+"'>"+data.pname+"</option>");
					});
				},
				"json"
				); */
		$.ajax({  
	         type : "post",  
	          url : "${pageContext.request.contextPath }/feedback_findAll.action",  
	          async : false,
	          dataType: "json",
	          success : function(data){ 
	        	  $(data).each(function (i,data) {
	        		  if(data.answer!=''&&data.answer!=null){
	        			  $("#feedback").append("<span style='color: rgb(255, 0, 0); font-family: 微软雅黑;'>问："
	      						+data.questions
	      						+"</span><br /><span style='font-family:微软雅黑;'>答："
	      						+data.answer
	      						+"</span><br /><br />");
	        		  }
					});
	          }  
	     });
	});
</script>
			<span style="font-size: 16px; font-family: 微软雅黑;">常见问答： </span>
			<br /><br />
</div>
<jsp:include page="bottom.jsp"></jsp:include>