/**
 * 控制知识库管理页面的按钮
 */


//$(document).ready(function() { 
//            // 为knowledgeForm绑定ajaxForm异步提交事件，并提供一个简单的回调函数。
//            $('#knowledgeForm').ajaxForm(function() { 
//                alert("Thank you for your comment!"); 
//            }); 
//        }); 


$(document).ready(function () {
	//options是一个ajaxForm的配置对象
	var options = {
		target: '#msg',   	      // 把服务器返回的内容放入id为msg的元素中
		beforeSubmit: callBackBefore, // 提交前的回调函数
		
		// 提交后的回调函数
		success: function (data) {
            
        },
		
	//other available options: 
		url : 'http://localhost:8080/QASystem/pages/knowledgeAdd.jsp', //默认是form的action，如果申明，则会覆盖
		type : 'POST',          // 默认值是form的method("GET" or "POST")，如果声明，则会覆盖
		dataType : null,      // html（默认）、xml、script、json接受服务器端返回的类型 
		//clearForm: true       // 成功提交后，清除所有表单元素的值
		resetForm: true,        // 成功提交后，重置所有表单元素的值 
		
		// $.ajax options can be used here too, for example: 
		timeout : 3000
	};
// bind form using 'ajaxForm'
$('#knowledgeForm').ajaxForm(options);
});

//callback function before(在这里可以对表单元素进行验证)
function callBackBefore(formData, jqForm, options){
    // formData: 数组对象，提交表单时，form插件会以ajax方式自动提交这些数据，格式如[{name:user,value:val},{name:pwd,value:pwd}]
    // jqForm: jQuery对象，封装了表单的元素
    // options: options对象
    var queryString=$.param(formData);
    var formElement=jqForm[0]; // 将jqForm转换为DOM对象
    var title=formElement.title.value; // 访问jqForm的DOM元素
    var content=formElement.content.value; // 访问jqForm的DOM元素
    //alert(title);
    //alert(content);
    
    //判断输入的title和content是否为空 或 全为空格
    if (isNull(title)) {
        alert("标题不能为空!");
        return false;
    } else if(isNull(content)) {
        alert("内容不能为空!");
        return false;
    } else{
    	return true;
    }
    
    return false; // 返回false，表单不会提交
}

//callback function after
//function showResponse(responseText) {
//	alert("123");
//	alert(responseText);
//    if (statusText == 'success') {
//        if (responseText.code == 1) {
//            alert(responseText.message);
//        }
//        else {
//            alert('error occurs!');
//        }
//    }
//    else {
//        alert('服务器错误！');
//    }
//}


//该function用来判断表单输入的字符串是否为空
function isNull( str ){
	if ( str == "" ) return true;
	var regu = "^[ ]+$";
	var re = new RegExp(regu);
	return re.test(str);
	}
