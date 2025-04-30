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

@keyframes fadeIn {from { opacity:0;
	transform: translateY(20px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}
.form-control:focus {
	border-color: #0d6efd;
	box-shadow: 0 0 0 0.2rem rgba(13, 110, 253, 0.25);
}

/* 사진첨부 */

.thumb {
  width: 100%;
  height: 100%;
  position: relative;
  overflow: hidden;
	
}

.thumb>img {
	width: 100%;
  height: 100%;
  object-fit: cover; /* 또는 contain */
  display: block;
  border-radius: 6px;
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
			alert("아이디를 입력해주세요");
			frm.u_id.focus();
			return false;
		}
		$.post('/user/idChk', "u_id="+frm.u_id.value, function(data) {
			$('#idChk').html(data);
		});
	}
	$(function() {
		var uploadfiles = [];
		
		// 클릭하면 파일 탐색기 열기
		$('#drop, #photo').on('click', function () {
			  // 이미지가 아직 없는 경우에만 열기
			  if ($('#photo').children().length === 0) {
		  $('#fileInput').click();
		  }
		});
		// ❌ 버튼 클릭 시 업로드 제거 & 이벤트 전파 차단
		$("#photo").on('click', function(e) {
		  var $target = $(e.target);
		  if ($target.hasClass('close')) {
		    e.stopPropagation(); //  클릭 이벤트 전파 중단
		    var idx = $target.attr('data-idx');
		    uploadfiles[idx].upload = 'disable'; // 삭제된 항목은 업로드 금지
		    $target.parent().remove(); // x를 클릭한 그림 삭제
		 // 이미지가 더 없으면 아이콘 다시 보여주기
		    if ($('#photo').children().length === 0) {
		      $('#uploadIcon').show();
		      uploadfiles = []; // 배열도 초기화
		    }
		  }
		});

		// 선택된 파일을 업로드 배열에 추가하고 미리보기 표시
		$('#fileInput').on('change', function (e) {
		  var files = e.target.files;
		  for (var i = 0; i < files.length; i++) {
		    var file = files[i];
		    var size = uploadfiles.push(file); // 업로드 배열에 저장
		    preview(file, size - 1);           // 미리보기 표시
		  }
		});

		$('#submit').on('click', function() {
			// 비밀번호 체크
			if (frm.password.value !== frm.password2.value) {
		        alert("비밀번호가 일치하지 않습니다");
		        frm.password2.focus();
		        return;
		    }
			var formData = new FormData();
			formData.append('u_id', frm.u_id.value);
			formData.append('name', frm.name.value);
			formData.append('email', frm.email.value);
			formData.append('password', frm.password.value);
			formData.append('tel', frm.tel.value);
			formData.append('address', frm.address.value);
			
			$.each(uploadfiles, function(i, file) {
				if (file.upload != 'disable') // 사용하지 않는 파일은 제외하고
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
	});
	function preview(file, idx) {
		var reader = new FileReader();
		reader.onload = (function(f, idx) {
			return function(e) {
			 // 아이콘과 텍스트 숨기기
		      $('#uploadIcon').hide();
				var div = '<div class="thumb"><div class="close" data-idx="'+idx+
					'">❌</div><img src="'+e.target.result+ '" title="'+escape(f.name)+'"/></div>';
				$("#photo").append(div);
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
      <%-- <form action="/admin/home/salemonthtab/issueAnInvoice?sr_id=${saleList.sr_id}&targetMonth=${targetMonth}" method="post" 
      style="display:inline;"> --%>
		<form action="/user/join" method="post" id="frm" enctype="multipart/form-data"s>
        <!-- 아이디 입력 -->
        <div class="mb-3 row align-items-center">
          <!-- 라벨 + 아이콘 -->
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-file-earmark-person me-2"></i>아이디
          </label>
          <!-- 입력창 -->
          <div class="col-sm-5">
            <input type="text" name="u_id" class="form-control" placeholder="아이디를 입력하세요" required="required" autofocus="autofocus">
          </div>
          <!-- 중복 체크 버튼 -->
          <div class="col-sm-3 ps-2">
            <button type="button" class="btn btn-warning btn-sm w-95" onclick="idChk()">
              중복체크
            </button>
          </div>
          <!-- 결과 메시지 -->
		<div class="offset-sm-4 col-sm-8">
			<span id="idChk" class="text-danger small mt-1 d-block"></span>
		</div>
        </div>
        <!-- 비밀번호 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-file-lock2 me-2"></i>암호
          </label>
          <div class="col-sm-8">
            <input type="password" name="password" class="form-control" required="required">
          </div>
        </div>
        <!-- 비밀번호 확인 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-file-lock2 me-2"></i>암호확인
          </label>
          <div class="col-sm-8">
            <input type="password" name="password2" class="form-control" required="required">
          </div>
        </div>
        <!-- 이름 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-person-vcard me-2"></i>이름
          </label>
          <div class="col-sm-8">
            <input type="text" name="name" class="form-control" required="required">
          </div>
        </div>
        <!-- 주소 입력 -->
		<div class="mb-3 row">
		  <label class="col-sm-4 col-form-label">
		    <i class="bi bi-geo-alt-fill me-2 text-primary"></i>주소
		  </label>
		  <div class="col-sm-8">
		    <input type="text" name="address" class="form-control" required="required" placeholder="도로명 주소 또는 지번 주소 입력">
		  </div>
		</div>
		<!-- 전화번호 입력 -->
		<div class="mb-3 row">
		  <label class="col-sm-4 col-form-label">
		    <i class="bi bi-telephone-fill me-2 text-success"></i>전화번호
		  </label>
		  <div class="col-sm-8">
		    <input type="text" name="tel" class="form-control" required="required" placeholder="010-1234-5678">
		  </div>
		</div>
        <!-- 이메일 입력 -->
        <div class="mb-3 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-envelope me-2"></i>이메일
          </label>
          <div class="col-sm-8">
            <input type="email" name="email" class="form-control" required="required">
          </div>
        </div>
        <div class="mb-4 row">
          <label class="col-sm-4 col-form-label">
            <i class="bi bi-image me-2"></i>회원사진
          </label>
          <div class="col-sm-8">
         	<!-- 숨겨진 파일 업로드 input -->
			<input type="file" id="fileInput" style="display: none;" multiple>
            <!-- 드래그 박스: 회색 배경 + 안내 텍스트 -->
            <div id="drop" class="rounded p-3 text-center bg-light">
              <!-- 아이콘과 텍스트 묶기 -->
			  <div id="uploadIcon">
			    <i class="bi bi-upload" style="font-size: 1.5rem;"></i><br>
			    <div>클릭하여 사진 첨부</div>
			  </div>
			  <div id="photo" class="mt-2"></div>
            </div>
          </div>
        </div>
        <!-- 가입 버튼 -->
        <div class="text-center mb-3">
          <input type="submit" value="가입하기" class="btn btn-primary px-4"/>
        </div>
        <!-- 로그인 이동 버튼 -->
        <div class="text-center">
          <a href="loginForm" class="btn btn-outline-secondary">
            <i class="bi bi-box-arrow-in-right me-1"></i>로그인
          </a>
        </div>
      </form>
      <div id="disp" class="mt-4"></div> <!-- 133번 행에서 받은 데이터를 보여줌 -->
    </div>
  </div>
</div>
</body>
</html>