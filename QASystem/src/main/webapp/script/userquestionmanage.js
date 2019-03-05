/**
 * 控制用户问题查看页面的按钮
 */

(function(){
	$(".btn_check_own").click(function(){
//		alert("123");
		var id = $(this).parent().attr("data-bind");
//		alert(id);
		window.location.href='questionCheck?id='+id;

	});
})()