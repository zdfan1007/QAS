$(document).ready(function(){
	/*
	function show(id){

	    var showDiv=document.getElementById(id);

	    var divList=document.getElementsByTagName('div');

	alert(divList.length);

	    for(i=0;i<divList.length;i++){

	        if(divList[i].id==id){

	           divList[i].style.display='block';

	         }

	        else{

	            divList[i].style.display='none';

	        }

	    }

	}
	*/
	
	$(".showdiv1").click(function(){
		var box =300;
		var th= $(window).scrollTop()+$(window).height()/1.6-box;
		var h =document.body.clientHeight;
		var rw =$(window).width()/2-box;
		var curHeight = $(".showbox1").height();
		var autoHeight = $(".showbox1").css('height','auto').height();
		$(".showbox1").height(curHeight).animate({height:autoHeight},500);
		$(".showbox1").animate({top:0,opacity:'show',width:600,right:0},500);
		return false;
	});
	
	$(".showdiv2").click(function(){
		var box =300;
		var th= $(window).scrollTop()+$(window).height()/1.6-box;
		var h =document.body.clientHeight;
		var rw =$(window).width()/2-box;
		var curHeight = $(".showbox2").height();
		var autoHeight = $(".showbox2").css('height','auto').height();
		$(".showbox2").height(curHeight).animate({height:autoHeight},500);
		$(".showbox2").animate({top:0,opacity:'show',width:600,right:0},500);
		return false;
	});
	
	$(".showdiv3").click(function(){
		var box =300;
		var th= $(window).scrollTop()+$(window).height()/1.6-box;
		var h =document.body.clientHeight;
		var rw =$(window).width()/2-box;
		var curHeight = $(".showbox3").height();
		var autoHeight = $(".showbox3").css('height','auto').height();
		$(".showbox3").height(curHeight).animate({height:autoHeight},500);
		$(".showbox3").animate({top:0,opacity:'show',width:600,right:0},500);
		return false;
	});
	
	$(".showbox1 .close").click(function(){
		$(this).parents(".showbox1").animate({top:0,opacity: 'hide',width:0,height:0,right:0},500);
		$("#zhezhao").css("display","none");
	});
	
	$(".showbox2 .close").click(function(){
		$(this).parents(".showbox2").animate({top:0,opacity: 'hide',width:0,height:0,right:0},500);
		$("#zhezhao").css("display","none");
	});
	
	$(".showbox3 .close").click(function(){
		$(this).parents(".showbox3").animate({top:0,opacity: 'hide',width:0,height:0,right:0},500);
		$("#zhezhao").css("display","none");
	});
});