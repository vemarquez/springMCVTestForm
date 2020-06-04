<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration Success</title>
</head>
<body>
    <div align="center">
        <table border="0">
            <tr>
                    <td colspan="1" align="center">
                    <h2><img src="/resources/images/wp_cabecera.png" width="140" height="120"></h2>
                    </td>
                    <td colspan="1" align="center">                    
                    <h2>Registro</h2>
                    </td>
                </tr>
            <tr>
                <td colspan="2" align="center">
                    <h3>Gracias por registarte:</h3>
                </td>
            </tr>
            <tr>
                <td>User Name:</td>
                <td>${userForm.usuario}</td>
            </tr>
            <tr>
                <td>E-mail:</td>
                <td>${userForm.email}</td>
            </tr>
            <tr>
                <td>Fecha Nacimiento:</td>
                <td>${userForm.fechaNacimiento}</td>
            </tr>
            <tr>
                <td>Profession:</td>
                <td>${userForm.asignacion}</td>
            </tr>
 
        </table>
    </div>
</body>
</html>