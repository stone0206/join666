<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>新增聚會</title>


    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <link rel="canonical" href="https://bootstrap5.hexschool.com/docs/5.1/examples/checkout/">



    <!-- Bootstrap core CSS -->
    <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" /docs/5.1/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href=" href=" /docs/5.1/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.1/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.1/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">


    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="form-validation.css" rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container">
        <main>
            <div class="py-5 text-center">
                <img class="d-block mx-auto mb-4" src="" alt="" width="" height="">
                <h2>新增聚會</h2>

            </div>




            <div class="row g-5">

                <div class="col-md-7 col-lg-8">

                    <form class="needs-validation" novalidate>
                        <div class="row g-3">



                            <div class="input-group mb-3 ">
                                <input type="file" class="form-control" id="inputGroupFile02">
                                <label class="input-group-text" for="inputGroupFile02">Upload</label>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">聚會主題</label>
                                <input type="text" class="form-control" id="address" placeholder="請填寫聚會主題" required>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>




                            <div class="col-12">
                                <label for="address" class="form-label">聚會主題</label>
                                <div class="control "><textarea class="textarea form-control" placeholder="請填寫聚會描述"
                                        name="content"></textarea></div>

                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>



                            <div class="col-12">
                                <label for="address" class="form-label">聚會地點</label>
                                <input type="text" class="form-control" id="address" placeholder="搜尋聚會地點" required>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>




                            <div class="col-12">
                                <label for="address" class="form-label">聚會時間</label>
                                <input type="date" class="form-control" id="address" placeholder="請輸入聚會時間" required>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>



                            <div class="col-12">
                                <label for="address" class="form-label">最晚審核時間</label>
                                <input type="date" class="form-control" id="address" placeholder="請輸入最晚審核時間" required>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>

                            <div class="col-12">
                                <label for="address" class="form-label">聚會人數</label>
                                <input type="text" class="form-control" id="address" placeholder="請輸入人數" required>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>


                            <div class="col-12">
                                <label for="address" class="form-label">聚會類型</label>

                                <select name="deptno" type="text" class="form-control" id="deptno" autocomplete="off">

                                    <option value="none" selected disabled hidden>請選擇選項</option>
                                    <option>電影</option>
                                    <option>唱歌</option>
                                    <option>出遊</option>
                                </select>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>





                            <div class="col-12">
                                <label for="address" class="form-label">付款方式</label>
                                <select name="deptno" type="text" class="form-control" id="deptno" autocomplete="off">

                                    <option value="none" selected disabled hidden>請選擇付款方式</option>
                                    <option>各付各</option>
                                    <option>你買單</option>
                                    <option>我請客</option>
                                </select>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>



                            <div class="col-12">
                                <label for="address" class="form-label">用餐預算</label>
                                <input type="text" class="form-control" id="address" placeholder="" required>
                                <div class="invalid-feedback">
                                    請輸入主題
                                </div>
                            </div>

                            <button
                                class="button is-fullwidth is-warning is-rounded has-text-black has-text-weight-bold"
                                type="submit">預覽</button>


                    </form>





</body>

</html>