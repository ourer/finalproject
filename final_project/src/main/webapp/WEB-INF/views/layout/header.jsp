<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>

</head>
<body>
   <nav class="navbar">
     <div class="container-fluid-start">
       <a class="navbar-brand" href="#"></a>
       <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
         <span class="navbar-toggler-icon"></span>
       </button>
       <div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
         <div class="offcanvas-header">
           <h1 class="offcanvas-title" id="offcanvasNavbarLabel">OURER</h1>
           <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
         </div>
         <div class="offcanvas-body">
           <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
             <li class="nav-item">
               <a class="nav-link active d-grid gap-2 col-12 mx-auto" aria-current="page" href="/group/register"><button type="button" class="btn btn-outline-warning">소모임 생성</button></a>
             </li>
             <c:if test="${ses.email == null }">
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/user/login">로그인</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" aria-current="page" href="/user/register">회원가입</a>
                </li>
             </c:if>
             <li class="nav-item">
                <div>
                <c:choose>
                <c:when test="${sespvo ne null }">
                   <img src="/upload/${fn:replace(sespvo.dir,'\\','/')}/${sespvo.uuid}_${sespvo.name}" class="rounded-circle mx-auto d-block" alt="..." style="width: 150px;">                
                </c:when>
                <c:otherwise>
					<img src="/upload/blank-profile.png" class="rounded-circle mx-auto d-block" alt="..." style="width: 140px;">
				</c:otherwise>
                </c:choose>
                  <div class="imgname">
                  <span id="imgname">${ses.name }</span>
                  <span>님</span></div>
                </div>
             </li>
              <c:if test="${ses.email != null }">
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="/user/logout">로그아웃</a>
             </li>
             </c:if>
             <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 마이 페이지
               </a>
               <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="/user/mypage/${ses.email }" >내가 활동하는 소모임</a></li>
                 <li><a class="dropdown-item" href="/user/management/${ses.email }" >내 소모임 관리</a></li>
                 <li><a class="dropdown-item" href="/favorite/mylike/${ses.email }">내가 찜한 소모임</a></li>
               </ul>
             </li>
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="/board/list">공지사항</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="#">사이트 소개</a>
             </li>
             <li class="nav-item">
               <a class="nav-link" aria-current="page" href="/category/categorymain">소모임 리스트</a>
             </li>
             <li class="nav-item dropdown">
               <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                 관리자용 버튼
               </a>
               <ul class="dropdown-menu">
                 <li><a class="dropdown-item" href="/group/grouplist" >소모임 전체 리스트</a></li>
                 <li><a class="dropdown-item" href="/user/userlist">전체 회원 조회</a></li>
               </ul>
             </li>
           </ul>
         </div>
       </div>
     </div>
   <div class="logo">
         <a href="/"><img alt="" src="/resources/img/logo.png" width="200px"></a>
   </div>
      <ul class="nav justify-content-end">
      <c:if test="${ses.email == null }">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/user/login">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/user/register">회원가입</a>
        </li>
      </c:if>
      <c:if test="${ses.email != null }">
         <li class="nav-item">
             <a class="nav-link" aria-current="page" href="/user/mypage/${ses.email }">${ses.name } 마이페이지</a>
          </li>
          <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="/user/logout">로그아웃</a>
        </li>
      </c:if>
        <li class="nav-item">
          <a class="nav-link" href="/board/list">공지사항</a>
        </li>
      </ul>
        <!-- search 라인 -->
   <div class="input-group mb-3">
      <form class="d-flex" role="search" action="/category/categorymain" method="get">
         <c:set value="${scvo.type }" var="typed"/>
            <select name="type" class="btn btn-outline-secondary" aria-expanded="false">
               <option value="a" ${typed eq 'a' ? 'selected':'' }>제목+내용</option>
               <option value="n" ${typed eq 'n' ? 'selected':'' }>제목</option>
               <option value="d" ${typed eq 'd' ? 'selected':'' }>내용</option>
            </select>
               <input class="form-control me-2" type="search" placeholder="관심사를 검색해보세요"  aria-label="Search" name="keyword" value="${scvo.keyword }">
                  <button class="btn btn-outline-warning" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
   </div>
   </nav>

<script src="https://kit.fontawesome.com/0466d36352.js" crossorigin="anonymous"></script>