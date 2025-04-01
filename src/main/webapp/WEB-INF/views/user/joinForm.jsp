<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* drop & drag */
	.drag-over { background: transparent; }
	.thumb { width: 100px; padding: 2px; float: left; }
	.thumb > img { width: 100%; }
	.thumb > .close { position: absolute; background: transparent; cursor: pointer; }
	#drop { border: 1px solid black; width: 300px; height: 200px; padding: 3px; }
</style>
<script type="text/javascript">
	function idChk() {
		if (!frm.u_id.value) {
			alert("아이디를 입력한 후에 체크하시오");
			frm.u_id.focus();
			return false;
		}
		$.post('idChk', "u_id="+frm.u_id.value, function(data) {
			$('#idChk').html(data);
		});
	}
	// drag & drop
/*  $(document).on("drop", function(e) {
		// 태그에 파일 넣기
		$('input[type="file"]').prop("files", e.originalEvent.dataTransfer.files);
	}); */
	$(function() {
		var uploadfiles = [];
		var $drop = $('#drop');
		$drop.on("dragenter", function(e) { //드래그 요소가 들어왔을떄
			$('#thumbnails').text("");
			$(this).addClass('drag-over');			
		}).on("dragleave", function(e) { //드래그 요소가 나갔을때
			$('#thumbnails').text("그림을 올려 놓으시오");
			$(this).removeClass('drag-over');
		}).on("dragover", function(e) {     // 드래그한 항목을 떨어뜨릴려고 올려 놨울 떄
			e.stopPropagation();  // 이밴트를 전달하지 마라
			e.preventDefault();   // 원래 자체 기능를 하지 마라
		}).on("drop", function(e) {        // 드래그한 항목을 떨어뜨릴 때
			e.preventDefault();  
			$(this).removeClass('drag-over');
			var files = e.originalEvent.dataTransfer.files; // 드래그 한 항복
			for (var i =0; i < files.length; i++) {
				var file = files[i];
				var size = uploadfiles.push(file); // 업로드 목록에 추가
				preview(file, size - 1); // 미리보기
			}
		});	
		$('#submit').on('click', function() {
			var formData = new FormData();
			formData.append('u_id', frm.u_id.value);
			formData.append('name', frm.name.value);
			formData.append('email', frm.email.value);
			formData.append('password', frm.password.value);
			$.each(uploadfiles, function(i, file) {
				if (file.upload != 'disable') // 사용하지 파일은 제외하고
					formData.append('file',file,file.name);
			});
			$.ajax({
				url:'/user/join', data:formData, type:'post',
				contentType:false,	processData:false,	enctype:'multipart/form-data',
				success: function(data) {
					// ajax를 사용하면 현재 화면이 유지 => 로그인 화면으로 전환 
					$('form').hide();      // 현재 화면 안보이게 
					$('#disp').html(data); // 로그인 화면 보이게
				}
			});
		});
		$("#thumbnails").on('click', function(e) {
			var $target = $(e.target);
			var idx = $target.attr('data-idx');
			uploadfiles[idx].upload = 'disable';  // 삭제된 항목은 업로드 금지
			$target.parent().remove(); // x를 클릭한 그림 삭제
		});
	});
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
			return function(e) {
				var div = '<div class="thumb"><div class="close" data-idx="'+idx+
					'">X</div><img src="'+e.target.result+ '" title="'+escape(f.name)+'"/></div>';
				$("#thumbnails").append(div);
			};
		})(file,idx);
		reader.readAsDataURL(file);
		// readAsDataURL : 컨텐츠를 특정 Blob 이나 File에서 읽어 오는 역할을 합니다
	}	
</script>
</head><body>
<div class="container text-center">
	<h2 class="text-primary">회원가입</h2>
<form name="frm">
<table class="table table-bordered table-info">
	<tr><td>아이디 <i class="bi bi-file-earmark-person icofont-2x"></i></td>
		<td><div class="row"><div class="col-auto"><input type="text" name="u_id" required="required" 
			autofocus="autofocus" class="form-control"></div><div class="col-auto"><input type="button" 
			value="중복체크" class="btn btn-warning btn-sm" onclick="idChk()"><span id="idChk" 
			class="err"></span></div></div></td></tr>
	<tr><td>암호 <i class="bi bi-file-lock2 icofont-2x"></i></td>
		<td><input type="password" name="password" required="required" class="form-control"></td></tr>
	<tr><td>암호확인 <i class="bi bi-file-lock2 icofont-2x"></i></td>
		<td><input type="password" name="password2" required="required" class="form-control"></td></tr>
	<tr><td>이름 <i class="bi bi-person-vcard icofont-2x"></i></td>
		<td><input type="text" name="name" required="required" class="form-control"></td></tr>
	<tr><td>이메일 <i class="bi bi-envelope icofont-2x"></i></td>
		<td><input type="email" name="email" required="required" class="form-control"></td></tr>
	<tr><th>사진 <i class="bi bi-file-earmark-person icofont-2x"></i></th>
		<td><div id="drop"><div id="thumbnails">그림을 올려 놓으세요</div></div></td></tr>
	<tr><td colspan="2" class="text-center">
		<input type="button" value="가입" class="btn btn-primary" id="submit"></td></tr>
</table>	
</form>
<div id="disp"></div>
	<a href="loginForm" class="btn btn-info">로그인</a>
</div>
</body>
</html>