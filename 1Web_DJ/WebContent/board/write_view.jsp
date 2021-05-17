<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/4.16.0/standard/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery.js"></script>
<script>
    
    function submit_ajax() {
        var querySrting = $(#reg_frm).serialize();
        $.ajax ({
            url: 'list.do',
            type:'POST', 
            data: querySrting,
            dataType: 'text',
            success: function(json) {
                //console.log(json);
                var result = JSON.parse(json);
                if (result.code=="success") {
            	    alert(result.desc)
            	    window.location.replace("content_view");
                } else {
            	    alert(result.desc);
                }
            }
        });
    }

    
    alert("aaa")
    
</script>
</head>
<body>
    <table width="500" cellpadding="0" cellspacing="0" border="1">
        <form id="reg_frm">
            <tr>
                <td> 이름 </td>
                <td> <input type="text" name="bName" size="50"> </td>
            </tr>    
            <tr>
                <td> 제목 </td>
                <td> <input type="text" name="bTitle" size="50"> </td>
            </tr>
            <tr>
                <td> 내용 </td>
                <td> <textarea placeholder="내용을 입력하세요." id="editor1"
                name="bContent"  class="form-control" style="height:200px;" rows="10" cols="80" >
                
                </textarea> 
                <script>
                CKEDITOR.replace( 'editor1' );
                </script>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록"> &nbsp;&nbsp;
                    <a href="list.do">목록보기</a>
                </td>
            </tr>
        </form>
    </table>
    
</body>
</html>