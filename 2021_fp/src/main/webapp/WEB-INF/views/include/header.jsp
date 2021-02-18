<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<c:set var="root" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/jobManyIcon.ico">
<meta charset="UTF-8">
<title>JobMany</title>
 <!-- 부트스트랩 & 아이콘 & CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href=" ${pageContext.request.contextPath}/resources/css/include/header.css">
</head>
<body>
<header>
	<div class="container">
	<a href="${root}/error">에러페이지 확인</a>
	<nav class="navbar navbar-expand-lg header-nav">
 		<a class="navbar-brand header-nav-logo" href="${root}/">
 			<span class="header-nav-logo-front h3">J</span>
 			<span class="header-nav-logo-tail h3">ob Many</span>
 		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse offset-md-5 header-nav-menu" id="navbarScroll">
			<ul class="navbar-nav my-2 my-lg-0 navbar-nav-scroll header-nav-menu-innerBox" style="max-height: 100px;">
				<li class="nav-item active header-nav-menu-innerBox-home">
					<a class="nav-link header-nav-menu-innerBox-home-font" href="${root}/">
						Home
					 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item dropdown header-nav-menu-innerBox-drop">
					<a class="nav-link dropdown-toggle header-nav-menu-innerBox-home-font" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
						Resume
					</a>
					<ul class="dropdown-menu header-nav-menu-innerBox-drop-ul" aria-labelledby="navbarScrollingDropdown">
						<li><a class="dropdown-item" href="${root}/resume/resume">Resume</a></li>
						<li><a class="dropdown-item" href="${root}/resume/resumeList">Resume List</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item" href="#">etc</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown header-nav-menu-innerBox-drop">
					<a class="nav-link dropdown-toggle header-nav-menu-innerBox-home-font" href="list" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
						Community
					</a>
					<ul class="dropdown-menu header-nav-menu-innerBox-drop-ul" aria-labelledby="navbarScrollingDropdown">
						<li><a class="dropdown-item" href="${root}/write">Write</a></li>
						<li><a class="dropdown-item" href="${root}/list">List</a></li>
						<li><hr class="dropdown-divider"></li>
						<li><a class="dropdown-item text-black-50" href="#">Talk</a></li>
					</ul>
				</li>
				<li class="nav-item dropdown header-nav-menu-innerBox-drop">
					<a class="nav-link dropdown-toggle header-nav-menu-innerBox-home-font" href="#" id="navbarScrollingDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
					<c:if test="${empty userInfo}">
						MyPage
					</c:if>
					${userInfo.unickname}
					</a>
					<ul class="dropdown-menu header-nav-menu-innerBox-drop-ul" aria-labelledby="navbarScrollingDropdown">
						<c:choose>
							<c:when test="${empty userInfo}">
								<li><a class="dropdown-item" href="${root}/member/login">Login</a></li>
								<li><a class="dropdown-item" href="${root}/member/signMember">Sign</a></li>
								<li><a class="dropdown-item" href="${root}/member/myList">스크랩</a></li>
							</c:when>
							<c:otherwise>
								<li><a class="dropdown-item" href="${root}/member/memberInfo">내 정보 보기 </a></li>
								<li><a class="dropdown-item" href="${root}/member/myList">스크랩</a></li>
								<%-- <li><a class="dropdown-item" href="${root}/member/findUser">ID | PW 찾기</a></li> --%>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="${root}/member/logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	</div>
</header>