/**
 * 控制用户管理页面的按钮
 */

(function(){
	$(".btn_delete_person").click(function(){
//		alert("123");
		var id = $(this).parent().attr("data-bind");
//		alert(id);
		var trEle = $(this).parent().parent().parent();
//		trEle.remove();
		$.ajax({
			type : 'POST',
			url : 'http://localhost:8080/QASystem/pages/personStatusUpdate.jsp',
			timeout : 5000, // 超时时间设置，单位毫秒
			dataType : "json",
			data : {
				'status' : "-1",
				'id' : id
			},
			//正常应该在success中执行ajax请求成功之后的操作，然而并不会用。
			success : function() {
				alert("AJAX 请求完成");
				trEle.remove();
			}
		});
		//不验证success，请求以后直接执行操作，一般情况下并不会出现问题
		trEle.remove();
	});
})()