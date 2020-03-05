<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>분양회원</title>
<script src="//code.jquery.com/jquery-2.2.4.min.js"></script>
</head>
<body>
	<h1>회원가입</h1>
	<hr>
	<form id="signFrm" name="signFrm" action="${pageContext.request.contextPath}/MEMBER/writeNormal" method="post">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" ></td>
					<td><input type="button" id="check" value="중복체크"></td>
				</tr>
				<tr>
					<td colspan=3 id="idCheck"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2"><input id="name" name="name" type="text"></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td colspan="2"><input id="password" name="password" placeholder = "숫자와문자포함6~12자리 " type="password"></td>
				</tr>
				<tr>
					<td>패스워드 확인</td>
					<td colspan="2"><input id="passwordCheck" name="passwordCheck" type="password"></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td colspan="2"><input id="email" name="email" placeholder = "이메일형식" type="email" required></td>
				</tr>
				<tr>
					<td>주소</td>
					<td colspan="2"><input id="address" name="address" type="text"></td>
				</tr>
				<tr>
					<td>핸드폰번호</td>
					<td colspan="2"><input id="phone" name="phone" placeholder = "010-1010-1010" type="text"></td>
				</tr>
				<tr>
					<td>계좌번호(선택)</td>
					<td colspan="2">
					<select id = "bank" name = "bank">
					<option value = "NULL">없음</option>					
					<option value = "B1">우리은행</option>
					<option value = "B2">국민은행</option>
					<option value = "B3">신한은행</option>
					<option value = "B4">하나은행</option>
					<option value = "B5">케이뱅크</option>
					<option value = "B6">카카오뱅크</option>
					<option value = "B7">KDB산업은행</option>
					<option value = "B8">IBK기업은행</option>
					<option value = "B9">회원수협</option>
					<option value = "B10">농-축협</option>
					<option value = "B11">산림조합</option>
					<option value = "B12">새마을금고</option>
					<option value = "B13">신용협동조합</option>			
					<option value = "B14">대구은행</option>
					<option value = "B15">부산은행</option>
					<option value = "B16">경남은행</option>
					<option value = "B17">광주은행</option>
					<option value = "B18">전북은행</option>
					<option value = "B19">제주은행</option>
					</select>					
					<input id="account" name="account" type="text"></td>
				</tr>				
				<tr>
					<td colspan="3"><input type="button" id="signUp" value="회원가입"></td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
<script type="text/javascript">
	$(document).ready(function(e){
		
		var idx = false;
		var passwordRegExp = /^[A-Za-z0-9]{6,12}$/;
		var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var phoneRegExp = /^\d{3}-\d{3,4}-\d{4}$/;

		
		$('#signUp').click(function(){	
			if($.trim($('#id').val()) == ''){
				alert("아이디 입력해주세요.");
				$('#id').focus();
				return;
			}else if($.trim($('#name').val()) == ''){
				alert("이름 입력해주세요.");
				$('#name').focus();
				return;				
			}else if($.trim($('#password').val()) == ''){
				alert("패스워드 입력해주세요.");
				$('#password').focus();
				return;
			}else if(!passwordRegExp.test($('#password').val())){					
				alert("숫자와 문자 포함 형태의 6~12자리 이내의 비밀번호를 입력해주세요.");
				$('#password').focus();
				return;
			}
			else if($('#password').val() != $('#passwordCheck').val()){
				alert('패스워드가 다릅니다.');
				$('#password').focus();
				return;
			}else if($.trim($('#email').val()) == ''){
				alert("이메일 입력해주세요.");
				$('#email').focus();
				return;
			}else if(!emailRegExp.test($('#email').val())){					
				alert("이메일형식에 맞추어 주세요.");
				$('#email').focus();
				return;
			}else if($.trim($('#address').val()) == ''){
				alert("주소 입력해주세요.");
				$('#address').focus();
				return;
			}else if($.trim($('#phone').val()) == ''){
				alert("핸드폰 입력해주세요.");
				$('#phone').focus();
				return;
			}else if(!phoneRegExp.test($('#phone').val())){					
				alert("핸드폰번호 형식에 맞추어주세요.");
				$('#phone').focus();
				return;
			}
			
			 if(idx==false){
				alert("아이디 중복체크를 해주세요.");
				return;
			}else{
				$('#signFrm').submit();
			} 
		});
		
		$('#check').click(function(){
			$.ajax({
				url: "${pageContext.request.contextPath}/MEMBER/idCheck.do",
				type: "GET",
				data:{
					"id":$('#id').val()
				},
				success: function(data){
					if(data == 0 && $.trim($('#id').val()) != '' ){
						idx=true;
						$('#id').attr("readonly",true);
						var html="<tr><td colspan='3' style='color: green'>사용가능</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}else{

						var html="<tr><td colspan='3' style='color: red'>사용불가능한 아이디 입니다.</td></tr>";
						$('#idCheck').empty();
						$('#idCheck').append(html);
					}
				},
				error: function(){
					alert("서버에러");
				}
			});
			

		});
		
	});
</script>
</html>