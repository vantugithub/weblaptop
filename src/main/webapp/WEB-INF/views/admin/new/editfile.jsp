<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
		
		<h1></h1>
			<div class="page-content">
				<div class="row">
							<br>
				    		<br>
				    		
				    		<h1><%=request.getAttribute("notice") != null ? request.getAttribute("notice") : "" %></h1>
				    		
				    		<c:forEach items="${product.listResult}" var="list">
				    		
				    <div align="center">
				    
				    <h1> ${list.name} </h1>
				    		<br>
				    		<br>
				    		<br>
				    		<br>
				        <h1> Upload Multiple Files </h1>
				        <c:url value='/admin/uploadfile/${list.id}' var="url" />
				        <form method="post" action="${url}" enctype="multipart/form-data">
				        
				            <p>Select files to upload. Press Add button to add more file
				                inputs.</p>
				            <table id="fileTable">
				                <tr>
				                    <td><input name="files" type="file" /></td>
				                </tr>
				            </table>
				            <br />
				            <input type="submit" value="Upload" />
				            <input id="addFile" type="button" value="Add File" />
				        </form>
				        <br />
				    </div>
					</c:forEach>
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
                                                                    + '   <input type="file" name="files" />'
                                                                    + '</td></tr>');
                                        });
 
                    });
</script>
</body>
</html>