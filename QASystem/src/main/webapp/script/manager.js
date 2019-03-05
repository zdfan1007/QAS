$(function(){
		//设置标杆
		var _line=parseInt($(window).height()/3);
		$(window).scroll(function(){
			//滚动0px，左侧导航固定定位
			if ($(window).scrollTop()>0) {
				$('.fl_l').css({'position':'fixed','top':30})
			}else{
				$('.fl_l').css({'position':'','top':''})
			};
			$('.fl_l li').eq(0).addClass('active');
			//滚动到标杆位置,左侧导航加active
			$('.fl_r li').each(function(){
				var _target=parseInt($(this).offset().top-$(window).scrollTop()-_line);
				var _i=$(this).index();
				if (_target<=0) {
					$('.fl_l li').removeClass('active');
					$('.fl_l li').eq(_i).addClass('active');
				}
				//如果到达页面底部，给左侧导航最后一个加active
				else if($(document).height()==$(window).scrollTop()+$(window).height()){
					$('.fl_l li').removeClass('active');
					$('.fl_l li').eq($('.fl_r li').length-1).addClass('active');
				}
			});
		});
		$('.fl_l li').click(function(){
			$(this).addClass('active').siblings().removeClass('active');
			var _i=$(this).index();
			 $('body, html').animate({scrollTop:$('.fl_r li').eq(_i).offset().top-_line},500);
		});
});