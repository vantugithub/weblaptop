<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit</title>

</head>
<body>
	<div class="main-content">
		<div class="main-content-inner">
			<div class="page-content">

				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						
						<c:forEach items="${model.listResult}" var="item">
						<c:url value='/admin/editproductid/${item.id}' var="url" />
						<form:form method="GET" action="${url}" modelAttribute="product">
						
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> User Created </label>
										<div class="col-sm-9">
											<input  readonly="" type="text" id="form-field-1-1" class="form-control" value="${item.userCreated}"  />
										</div>
								</div>
						</div>
						
						<form:input  path="userModified" type="hidden" id="form-field-1-1" class="form-control" value="${pageContext.request.userPrincipal.name}" />
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Data Created </label>
										<div class="col-sm-9">
											<input readonly="" type="text" id="form-field-1-1" class="form-control" value="${item.dateCreated}"  />
										</div>
								</div>
						</div>
						
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Name </label>
										<div class="col-sm-9">
											<form:input type="text" id="form-field-1-1" class="form-control" path="name" value="${item.name}"  />
										</div>
								</div>
						</div>
						
						
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Price </label>
										<div class="col-sm-9">
											<form:input path="price" type="text" id="form-field-1-1" class="form-control" value="${item.price}"/>
										</div>
								</div>
						</div>
						
						
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Promotion price </label>
										<div class="col-sm-9">
											<form:input path="promotionPrice" type="text" id="form-field-1-1" class="form-control"  value="${item.promotionPrice}"/>
										</div>
								</div>
						</div>
						
						
						
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1-1"> Warranty </label>
										<div class="col-sm-9">
											<form:input path="warranty" type="text" id="form-field-1-1" class="form-control" value="${item.warranty}" />
										</div>
								</div>
						</div>
						
						
						<div class="col-sm-7">
								<div class="form-group">
										<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> Status </label>

										<div class="col-sm-9">
											<form:input type="text" id="form-field-1" path="status" class="col-xs-10 col-sm-5" value="${item.status}" />
										</div>
								</div>
						</div>
						
						<div class="space-4"></div>
						<div class="space-4"></div>
						
						
						<div class="col-sm-7">
						<h4 class="header green clearfix">
							Edit content
						</h4>
										<div class="widget-box widget-color-blue">
											<div class="widget-header widget-header-small">  </div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<textarea name="content" data-provide="markdown"  data-iconlibrary="fa" rows="10" >${item.content}</textarea>
												</div>

												<div class="widget-toolbox padding-4 clearfix">
													<div class="btn-group pull-left">
														<button class="btn btn-sm btn-info">
															<i class="ace-icon fa fa-times bigger-125"></i>
															Cancel
														</button>
													</div>

													<div class="btn-group pull-right">
														<button type="submit" class="btn btn-sm btn-purple">
															<i class="ace-icon fa fa-floppy-o bigger-125"></i>
															Save
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-sm-7">
									<h4 class="header green clearfix">
									Edit Description
									</h4>
										<div class="widget-box widget-color-blue">
											<div class="widget-header widget-header-small">  </div>

											<div class="widget-body">
												<div class="widget-main no-padding">
													<textarea name="description" data-provide="markdown" data-iconibrary="fa" rows="10">${item.description}</textarea>
												</div>

												<div class="widget-toolbox padding-4 clearfix">
													<div class="btn-group pull-left">
														<button class="btn btn-sm btn-info">
															<i class="ace-icon fa fa-times bigger-125"></i>
															Cancel
														</button>
													</div>

													<div class="btn-group pull-right">
														<button type="submit" class="btn btn-sm btn-purple">
															<i class="ace-icon fa fa-floppy-o bigger-125"></i>
															Save
														</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									
									
									</form:form>
								</c:forEach>

						<!-- PAGE CONTENT ENDS -->
					</div>
				</div>
			</div>
		</div>
						<!-- Upload file -->
				
	</div>
				
	<script type="text/javascript">
			jQuery(function($){
	
	$('textarea[data-provide="markdown"]').each(function(){
        var $this = $(this);

		if ($this.data('markdown')) {
		  $this.data('markdown').showEditor();
		}
		else $this.markdown()
		
		$this.parent().find('.btn').addClass('btn-white');
    })
	
	
	
	function showErrorAlert (reason, detail) {
		var msg='';
		if (reason==='unsupported-file-type') { msg = "Unsupported format " +detail; }
		else {
			//console.log("error uploading file", reason, detail);
		}
		$('<div class="alert"> <button type="button" class="close" data-dismiss="alert">&times;</button>'+ 
		 '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
	}

	//$('#editor1').ace_wysiwyg();//this will create the default editor will all buttons

	//but we want to change a few buttons colors for the third style
	$('#editor1').ace_wysiwyg({
		toolbar:
		[
			'font',
			null,
			'fontSize',
			null,
			{name:'bold', className:'btn-info'},
			{name:'italic', className:'btn-info'},
			{name:'strikethrough', className:'btn-info'},
			{name:'underline', className:'btn-info'},
			null,
			{name:'insertunorderedlist', className:'btn-success'},
			{name:'insertorderedlist', className:'btn-success'},
			{name:'outdent', className:'btn-purple'},
			{name:'indent', className:'btn-purple'},
			null,
			{name:'justifyleft', className:'btn-primary'},
			{name:'justifycenter', className:'btn-primary'},
			{name:'justifyright', className:'btn-primary'},
			{name:'justifyfull', className:'btn-inverse'},
			null,
			{name:'createLink', className:'btn-pink'},
			{name:'unlink', className:'btn-pink'},
			null,
			{name:'insertImage', className:'btn-success'},
			null,
			'foreColor',
			null,
			{name:'undo', className:'btn-grey'},
			{name:'redo', className:'btn-grey'}
		],
		'wysiwyg': {
			fileUploadError: showErrorAlert
		}
	}).prev().addClass('wysiwyg-style2');


	$('#editor2').css({'height':'200px'}).ace_wysiwyg({
		toolbar_place: function(toolbar) {
			return $(this).closest('.widget-box')
			       .find('.widget-header').prepend(toolbar)
				   .find('.wysiwyg-toolbar').addClass('inline');
		},
		toolbar:
		[
			'bold',
			{name:'italic' , title:'Change Title!', icon: 'ace-icon fa fa-leaf'},
			'strikethrough',
			null,
			'insertunorderedlist',
			'insertorderedlist',
			null,
			'justifyleft',
			'justifycenter',
			'justifyright'
		],
		speech_button: false
	});
	
	


	$('[data-toggle="buttons"] .btn').on('click', function(e){
		var target = $(this).find('input[type=radio]');
		var which = parseInt(target.val());
		var toolbar = $('#editor1').prev().get(0);
		if(which >= 1 && which <= 4) {
			toolbar.className = toolbar.className.replace(/wysiwyg\-style(1|2)/g , '');
			if(which == 1) $(toolbar).addClass('wysiwyg-style1');
			else if(which == 2) $(toolbar).addClass('wysiwyg-style2');
			if(which == 4) {
				$(toolbar).find('.btn-group > .btn').addClass('btn-white btn-round');
			} else $(toolbar).find('.btn-group > .btn-white').removeClass('btn-white btn-round');
		}
	});


	if ( typeof jQuery.ui !== 'undefined' && ace.vars['webkit'] ) {
		
		var lastResizableImg = null;
		function destroyResizable() {
			if(lastResizableImg == null) return;
			lastResizableImg.resizable( "destroy" );
			lastResizableImg.removeData('resizable');
			lastResizableImg = null;
		}

		var enableImageResize = function() {
			$('.wysiwyg-editor')
			.on('mousedown', function(e) {
				var target = $(e.target);
				if( e.target instanceof HTMLImageElement ) {
					if( !target.data('resizable') ) {
						target.resizable({
							aspectRatio: e.target.width / e.target.height,
						});
						target.data('resizable', true);
						
						if( lastResizableImg != null ) {
							//disable previous resizable image
							lastResizableImg.resizable( "destroy" );
							lastResizableImg.removeData('resizable');
						}
						lastResizableImg = target;
					}
				}
			})
			.on('click', function(e) {
				if( lastResizableImg != null && !(e.target instanceof HTMLImageElement) ) {
					destroyResizable();
				}
			})
			.on('keydown', function() {
				destroyResizable();
			});
	    }

		enableImageResize();
	}


});
			
		</script>
		
		


</body>
</html>