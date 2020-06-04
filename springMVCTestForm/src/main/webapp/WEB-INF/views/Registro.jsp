<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
img.one {
  height: auto;
  width: auto;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registro</title>
</head>
<body>
  
    <div align="center">
        <form:form action="register" method="post" commandName="userForm">
            <table border="0">
                <tr>
                    <td colspan="1" align="center">
                    <h2><img src= "${pageContext.request.contextPath}/resources/images/wp_cabecera.png" ></h2>
                    </td>
                    <td colspan="1" align="center">                    
                    <h2>Registro</h2>
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td><form:input path="usuario" /></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><form:password path="password" /></td>
                </tr>
                <tr>
                    <td>E-mail:</td>
                    <td><form:input path="email" /></td>
                </tr>
                <tr>
                    <td>Fecha de Nacimiento (mm/dd/yyyy):</td>
                    <td><form:input path="fechaNacimiento" /></td>
                </tr>
                <tr>
                    <td>Asignación:</td>
                    <td><form:select path="asignacion" items="${asignacionList}" /></td>
                </tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Register" /></td>
                </tr>
            </table>
        </form:form>
    </div>
</body>
</html>