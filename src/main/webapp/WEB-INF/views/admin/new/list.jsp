<%@include file="/common/taglib.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách bài viết</title>
	</head>

	<body>
		<div class="main-content">
		<c:if test="${not empty notice}">
                            <div class="alert alert-success">
                                    ${notice}
                            </div>
       	</c:if>
		<form action="<c:url value='/admin/listproduct'/>" id="formSubmit" method="get">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="#">Trang chủ</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<a  flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												   data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"
												   title='Thêm sản phẩm' href='#'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<a  flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold"
												   data-toggle="modal" data-target="#exampleModal1" data-whatever="@mdo"
												   title='Thêm thể loại' href='#'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" title='Xóa bài viết'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th>Name's Product</th>
														<th>Price's Product</th>
														<th>Thao tác content</th>
														<th>Thao tác file</th>
														<th>Thao tác description</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td>${item.name}</td>
															<td>${item.price}</td>
															<td>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật bài viết" href="<c:url value='/admin/editproduct/${item.id}'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
															<td>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật hình ảnh" href="<c:url value='/admin/editfile/${item.id}'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
															<td>																
																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật hình ảnh" href="<c:url value='/admin/editdescription/${item.id}'/>"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>	
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="" id="limit" name="limit"/>									
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		
		
<div class="modal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New product</h5>
        
      </div>
      <div class="modal-body">
      <c:url value='/admin/createNewProduct' var="url1" />
        <form:form method="POST" action="${url1}" modelAttribute="catalog" name="formProduct">
        <form>
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Name product:</label>
            <form:input type="text" class="form-control" path="name" />
          </div>
	          <div class="form-group">
			        <form:select class="form-group" id="inlineFormCustomSelect" path="id">
			        <form:option value="selected">Choose......................................</form:option>
			        <c:forEach items="${lisCatalog}" var="lis">
			        <form:option value="${lis.id}" name=""> ${lis.name} </form:option>
			        </c:forEach>
			        </form:select>
			  </div>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save</button>
        </form>
        </form:form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>



<div class="modal" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Thể loại mới</h5>
      </div>
      <div class="modal-body">
      <c:url value='/admin/createNewModel' var="url11" />
        <form method="POST" action="${url11}">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Tên thể loại:</label>
            <input type="text" name="name" class="form-control" id="recipient-name">
          </div>
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save</button>
        </form>
      </div>
      <div class="modal-footer">
      </div>
    </div>
  </div>
</div>
		</div>
		<!-- /.main-content -->
		<script>
			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			$(function () {
		        window.pagObj = $('#pagination').twbsPagination({
		            totalPages: totalPages,
		            visiblePages: 10,
		            startPage: currentPage,
		            onPageClick: function (event, page) {
		            	if (currentPage != page) {
		            		$('#limit').val(2);
							$('#page').val(page);
							$('#formSubmit').submit();
						}
		            }
		        });
		    });
		</script>
	</body>
	</html>