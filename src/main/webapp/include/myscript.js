/**
 *  myscript
 */

 function logout() {
	var result = confirm("로그아웃 하시겠습니까?");
	if (result) {
		location.href = "/views/user_views/logout.jsp";
	}
}
