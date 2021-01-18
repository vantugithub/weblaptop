<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">
				<div class="row">
					<div class="col-xs-12">
					
					<c:forEach items="${productDescription.listResult}" var = "item">
					<c:url value='/admin/editdescriptionid/${item.id}' var="url" />
					<form action="${url}" method="POST" enctype="multipart/form-data">
							<table id="fileTable">
				                <tr>
				                    <td><input name="titles" placeholder="Title" type="text" /></td>
				                </tr>
				                <tr>
				                    <td><input name="headContents" placeholder="Head content" type="text" /></td>
				                </tr>
				                <tr>
				                    <td><input name="files" placeholder="File" type="file" /></td>
				                </tr>
				                <tr>
				                    <td><input name="footContents" placeholder="Foot content" type="text" /></td>
				                </tr>
				            </table>
				            <br/>
				            <input id="addFile" type="button" value="Add File" />
				            <input id="submit" type="submit" value="Upload File" />
					</form>
					</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script>
    $(document)
            .ready(
                    function() {
                        //add more file components if Add is clicked
                        $('#addFile')
                                .click(
                                        function() {
                                            var fileIndex = $('#fileTable tr')
                                                    .children().length - 1;
                                            $('#fileTable')
                                                    .append(
                                                    		'<tr><td>'
                                                            + '   <input type="text" name="titles" placeholder="Title" />'
                                                            + '</td></tr>'
                                                            +'<tr><td>'
                                                            + '   <input type="text" name="headContents" placeholder="Head content" />'
                                                            + '</td></tr>'
                                                            +'<tr><td>'
                                                            + '   <input type="file" name="files" placeholder="File" />'
                                                            + '</td></tr>'
                                                            +'<tr><td>'
                                                            + '   <input type="text" name="footContents" placeholder="Foot content" />'
                                                            + '</td></tr>'
                                                    );
                                        });
 
                    });
</script>
</body>
</html>