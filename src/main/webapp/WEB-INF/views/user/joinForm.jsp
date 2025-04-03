<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../setting/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body {
    background: linear-gradient(to right, #f8f9fa, #e3f2fd);
  }

  .signup-card {
    animation: fadeIn 0.6s ease-in-out;
  }

  #drop {
    border: 2px dashed #0d6efd;
    color: #6c757d;
    transition: all 0.3s;
  }

  #drop:hover {
    background-color: #e9f5ff;
    cursor: pointer;
    color: #0d6efd;
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .form-control:focus {
    border-color: #0d6efd;
    box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
  }

/* drop & drag */
.drag-over {
	background: transparent;
}

.thumb {
	width: 100px;
	padding: 2px;
	float: left;
}

.thumb>img {
	width: 100%;
}

.thumb>.close {
	position: absolute;
	background: transparent;
	cursor: pointer;
}

#drop {
	border: 1px solid black;
	width: 300px;
	height: 200px;
	padding: 3px;
}
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
</head>
<body>
	<!-- 전체 컨테이너: 화면 가운데 정렬 + 상하 여백 -->
<div class="container py-5" style="max-width: 720px;">

  <!-- 회원가입 박스를 카드로 감싸고, 그림자와 둥근 모서리 추가 -->
  <div class="card shadow-lg rounded-4 signup-card">

    <!-- 카드 본문 부분: 내부 여백(p-5)을 줘서 콘텐츠 공간 확보 -->
    <div class="card-body p-5">

      <!-- 제목과 아이콘: 중앙 정렬된 타이틀 섹션 -->
      <div class="text-center mb-4">
        <!-- 상단 아이콘 (회원가입을 상징) -->
        <i class="bi bi-person-plus-fill text-primary" style="font-size: 3rem;"></i>
        <!-- 제목 -->
        <h2 class="text-primary mt-2">회원가입</h2>
      </div>

      <!-- 회원가입 form 시작 -->
      <form name="frm">

        <!-- 아이디 입력 -->
        <div class="mb-3 row align-items-center">
          <!-- 라벨 + 아이콘 -->
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-file-earmark-person me-2"></i>아이디
          </label>
          <!-- 입력창 -->
          <div class="col-sm-5">
            <input type="text" name="u_id" class="form-control" required autofocus>
          </div>
          <!-- 중복 체크 버튼 -->
          <div class="col-sm-3">
            <button type="button" class="btn btn-warning btn-sm w-100" onclick="idChk()">
              <i class="bi bi-check2-circle me-1"></i>중복체크
            </button>
          </div>
        </div>
        <!-- 비밀번호 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-file-lock2 me-2"></i>암호
          </label>
          <div class="col-sm-8">
            <input type="password" name="password" class="form-control" required>
          </div>
        </div>
        <!-- 비밀번호 확인 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-file-lock2 me-2"></i>암호확인
          </label>
          <div class="col-sm-8">
            <input type="password" name="password2" class="form-control" required>
          </div>
        </div>
        <!-- 이름 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-person-vcard me-2"></i>이름
          </label>
          <div class="col-sm-8">
            <input type="text" name="name" class="form-control" required>
          </div>
        </div>
        <!-- 이메일 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-envelope me-2"></i>이메일
          </label>
          <div class="col-sm-8">
            <input type="email" name="email" class="form-control" required>
          </div>
        </div>
        <!-- 회원사진 드래그 앤 드롭 업로드 영역 -->
        <div class="mb-4 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-image me-2"></i>회원사진
          </label>
          <div class="col-sm-8">
            <!-- 드래그 박스: 회색 배경 + 업로드 아이콘 + 안내 텍스트 -->
            <div id="drop" class="rounded p-3 text-center bg-light">
              <i class="bi bi-upload" style="font-size: 1.5rem;"></i><br>
              <div id="thumbnails" class="mt-2">사진을 올려 주세요</div>
            </div>
          </div>
        </div>
        <!-- 가입 버튼 -->
        <div class="text-center mb-3">
          <button type="submit" class="btn btn-primary px-4">
            <i class="bi bi-person-check-fill me-2"></i>가입
          </button>
        </div>
        <!-- 로그인 이동 버튼 -->
        <div class="text-center">
          <a href="loginForm" class="btn btn-outline-secondary">
            <i class="bi bi-box-arrow-in-right me-1"></i>로그인
          </a>
        </div>
      </form>
    </div>
  </div>
</div>


</body>
</html>