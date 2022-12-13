<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<html>

<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
        crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>聚會管理</title>
</head>

<body>
    

    <main>
        <h1 class="text-center">聚會管理</h1>
        <div class="container">
            <table id="idtable" class="table">
                <thead>
                    <tr>
                        <th scope="col">主題
                            </td>
                        <th scope="col">發起人ID
                            </td>

                        <th scope="col">檢舉人ID
                            </td>
                        <th scope="col">狀態
                            </td>
                        <th scope="col">檢舉內容
                            </td>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${userList }" var="u">
                        <tr>

                            <td>唱歌</td>
                            <td>A123</td>
                            <td>b123</td>
                            <td>檢舉</td>
                            <td>檢舉內容</td>


                            <td><a href="javascript:if (confirm ('確認刪除?')) location='/Project/DeleteEmps.do?empno=${u.empno }'"
                                    role="button" class="btn btn-outline-danger ">刪除</a></td>



                        </tr>
                    </c:forEach>
                </tbody>
            </table>








    </main>

</body>

</html>