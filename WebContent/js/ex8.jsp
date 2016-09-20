<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var s="seoul?자바&123+4";

//seoul %3F% uC790%uBC14% 26 123 + 4
var out;
out=escape(s);
console.log(out);

//seoul %3F% EC%9E%90%EB%B0%94% 26 123 %2B 4
out=encodeURIComponent(s);
console.log(out);
</script>

</head>
<body>

</body>
</html>