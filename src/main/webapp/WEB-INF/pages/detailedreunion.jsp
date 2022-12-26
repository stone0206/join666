<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="INTUITIVE">
    <meta name="description" content="">
    <title>detailedreunion</title>
     <link rel="stylesheet" href="${contextRoot}/css/nicepage.css" media="screen">
    <link rel="stylesheet" href="${contextRoot}/css/Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="${contextRoot}/js/jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="${contextRoot}/js/nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 5.1.5, nicepage.com">
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lobster:400">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": "",
		"logo": "images/default-logo.png"
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">
  </head>
  <body data-home-page="Home.html" data-home-page-title="Home" class="u-body u-xl-mode" data-lang="en"><header class="u-clearfix u-header u-header" id="sec-9021"><div class="u-clearfix u-sheet u-sheet-1">
  
    <header>
		<jsp:include page="/WEB-INF/layout/navbar.jsp" />
	</header>
        <a href="https://nicepage.com" class="u-image u-logo u-image-1">
          <img src="images/default-logo.png" class="u-logo-image u-logo-image-1">
        </a>
      </div></header>
      
    <section class="u-clearfix u-section-1" id="sec-0a24">
      <div class="u-clearfix u-sheet u-sheet-1">
        <img class="u-image u-image-default u-image-1" src="${reunion.picture}">
        <h1 class="u-text u-text-default u-text-1">${reunion.topic}</h1>
        <p class="u-text u-text-2"> ${reunion.holdTime}(最後審核${reunion.reviewTime})</p>
<%--         <c:if test="${loginUser!=null}"> --%>
<%--         <a href="/insertReunionreport?id=${reunion.reunionid}" class="u-border-2 u-border-palette-2-base u-btn u-btn-round u-button-style u-hover-palette-2-base u-none u-radius-6 u-text-body-color u-text-hover-white u-btn-1">檢舉</a> --%>
<%--          </c:if> --%>
         <c:if test="${loginUser==null}">
        <a href="" class="u-border-2 u-border-palette-2-base u-btn u-btn-round u-button-style u-hover-palette-2-base u-none u-radius-6 u-text-body-color u-text-hover-white u-btn-1">請登入檢舉</a>
        </c:if>
         <c:if test="${loginUser!=null}">
        <button type="button" class="u-border-2 u-border-palette-2-base u-btn u-btn-round u-button-style u-hover-palette-2-base u-none u-radius-6 u-text-body-color u-text-hover-white u-btn-1" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="@mdo">檢舉</button>
        </c:if>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">檢舉聚會</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form  action="/insertReunionreport" method="post">
          <div class="mb-3">
<!--             <label for="recipient-name" class="col-form-label" type="hidden">聚會id</label> -->
            <input type="hidden" class="form-control" id="recipient-name" name="reunionid" value="${reunion.reunionid}" readonly  >
          </div>
          <div class="mb-3">
            <label for="message-text" class="col-form-label">檢舉內容</label>
            <textarea class="form-control" id="message-text" name="content"></textarea>
          </div>
          
           <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">離開</button>
        <button type="submit" class="btn btn-primary"  >確定</button>
      </div>
        </form>
      </div>
     
    </div>
  </div>
</div>
        
 
        <p class="u-text u-text-3">報名人數</p>
        <p class="u-text u-text-4">4人</p>
        <c:if test="${loginUser!=null}">
<%--         <c:if test="${loginUser.reunion.reunionid!=null}"> --%>
         <a href="" class="u-border-2 u-border-grey-75 u-btn u-btn-round u-button-style u-hover-palette-4-base u-palette-3-base u-radius-50 u-btn-2">審核</a>
<%--         </c:if> --%>
<%--         ${loginUser} --%>
        <a href="/insertRegister?id=${reunion.reunionid}" class="u-border-2 u-border-grey-75 u-btn u-btn-round u-button-style u-hover-palette-4-base u-palette-3-base u-radius-50 u-btn-2">報名</a>
        
        </c:if>
        <c:if test="${loginUser==null}">
        <a href="" class="u-border-2 u-border-grey-75 u-btn u-btn-round u-button-style u-hover-palette-4-base u-palette-3-base u-radius-50 u-btn-2">請登入報名</a>
        </c:if>
        <p class="u-text u-text-5"> ${reunion.content}
        </p><span class="u-icon u-icon-1"><svg class="u-svg-link" preserveAspectRatio="xMidYMin slice" viewBox="0 0 59.51 59.51" style=""><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#svg-e5a9"></use></svg><svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" xml:space="preserve" class="u-svg-content" viewBox="0 0 59.51 59.51" x="0px" y="0px" id="svg-e5a9" style="enable-background:new 0 0 59.51 59.51;"><polygon style="fill:#FFFFFF;" points="53.057,24.76 43.057,24.76 17.057,24.76 7.057,24.76 3.402,53.76 56.171,53.76 "></polygon><path style="fill:#556080;" d="M53.057,24.76l3.114,29H3.402l3.655-29h10h26H53.057 M55.752,21.76h-2.695h-10h-26h-10H4.411
	L4.08,24.385l-3.655,29L0,56.76h3.402h52.769h3.339l-0.357-3.32l-3.114-29L55.752,21.76L55.752,21.76z"></path><path style="fill:#EBBA16;" d="M13.684,49.76c-0.257,0-0.513-0.016-0.769-0.047c-0.218-0.026-0.438-0.067-0.653-0.124
	c-0.535-0.138-0.856-0.684-0.718-1.218c0.138-0.535,0.683-0.86,1.218-0.718c0.132,0.033,0.264,0.059,0.396,0.075
	c0.403,0.05,0.811,0.037,1.215-0.015c0.552-0.065,1.049,0.319,1.117,0.867c0.069,0.548-0.319,1.048-0.867,1.117
	C14.31,49.738,13.995,49.76,13.684,49.76z M18.334,48.602c-0.401,0-0.779-0.243-0.933-0.64c-0.199-0.516,0.058-1.095,0.572-1.293
	c0.592-0.229,1.188-0.483,1.774-0.759c0.503-0.235,1.096-0.019,1.33,0.48c0.234,0.5,0.02,1.096-0.48,1.33
	c-0.628,0.295-1.269,0.568-1.903,0.813C18.576,48.581,18.454,48.602,18.334,48.602z M9.987,46.87c-0.507,0-0.941-0.384-0.994-0.898
	c-0.02-0.197-0.028-0.395-0.028-0.592c0-0.116,0.003-0.232,0.009-0.347c0.023-0.469,0.099-0.942,0.225-1.406
	c0.144-0.535,0.697-0.853,1.226-0.704c0.533,0.144,0.849,0.692,0.704,1.226c-0.088,0.326-0.141,0.657-0.156,0.983
	c-0.004,0.082-0.007,0.165-0.007,0.248c0,0.129,0.005,0.26,0.019,0.389c0.056,0.55-0.345,1.04-0.894,1.097
	C10.055,46.868,10.021,46.87,9.987,46.87z M23.666,45.871c-0.327,0-0.648-0.16-0.84-0.455c-0.301-0.464-0.169-1.083,0.294-1.384
	c0.535-0.347,1.066-0.72,1.58-1.107c0.444-0.332,1.068-0.241,1.401,0.196c0.332,0.441,0.244,1.068-0.196,1.401
	c-0.552,0.415-1.122,0.815-1.695,1.188C24.041,45.819,23.853,45.871,23.666,45.871z M28.425,42.221c-0.309,0-0.613-0.143-0.81-0.411
	c-0.325-0.446-0.227-1.072,0.22-1.397c0.209-0.151,0.422-0.3,0.641-0.441c0.377-0.245,0.781-0.477,1.2-0.688
	c0.496-0.247,1.095-0.048,1.343,0.444c0.248,0.493,0.049,1.095-0.444,1.343c-0.354,0.178-0.693,0.372-1.01,0.577
	c-0.188,0.123-0.372,0.25-0.552,0.382C28.835,42.159,28.629,42.221,28.425,42.221z M12.469,41.748c-0.355,0-0.699-0.189-0.88-0.523
	c-0.264-0.485-0.083-1.092,0.402-1.355c0.518-0.281,1.071-0.456,1.644-0.52c0.29-0.033,0.593-0.032,0.891,0.008
	c0.547,0.072,0.933,0.574,0.86,1.122c-0.072,0.546-0.561,0.931-1.122,0.86c-0.133-0.018-0.271-0.018-0.406-0.002
	c-0.316,0.034-0.623,0.132-0.913,0.289C12.793,41.709,12.63,41.748,12.469,41.748z M33.903,39.896c-0.462,0-0.877-0.321-0.977-0.791
	c-0.115-0.541,0.229-1.072,0.769-1.187c0.643-0.138,1.335-0.252,2.058-0.342c0.553-0.081,1.047,0.32,1.115,0.869
	c0.068,0.548-0.321,1.048-0.869,1.115c-0.665,0.083-1.3,0.188-1.886,0.313C34.042,39.889,33.972,39.896,33.903,39.896z
	 M39.863,39.279c-0.533,0-0.977-0.421-0.998-0.959c-0.022-0.552,0.406-1.018,0.958-1.04l1.993-0.082
	c0.55-0.05,1.02,0.401,1.045,0.954c0.025,0.551-0.402,1.019-0.954,1.044l-2.002,0.082C39.892,39.279,39.877,39.279,39.863,39.279z
	 M45.842,38.836c-0.465,0-0.881-0.325-0.979-0.798c-0.111-0.541,0.236-1.07,0.777-1.182c0.578-0.119,1.006-0.286,1.347-0.525
	c0.437-0.341,1.102-0.285,1.438,0.149c0.339,0.437,0.296,1.039-0.14,1.378c-0.055,0.042-0.11,0.083-0.169,0.122
	c-0.544,0.384-1.229,0.661-2.072,0.835C45.977,38.829,45.908,38.836,45.842,38.836z M49.911,34.806
	c-0.098,0-0.197-0.015-0.296-0.045c-0.527-0.163-0.823-0.724-0.659-1.251c0.053-0.171,0.086-0.341,0.097-0.506l0.004-0.116
	c0-0.229-0.044-0.462-0.13-0.694c-0.192-0.518,0.071-1.093,0.59-1.285c0.514-0.191,1.094,0.071,1.285,0.59
	c0.169,0.455,0.255,0.923,0.255,1.39c0,0.084-0.003,0.167-0.008,0.25c-0.022,0.324-0.084,0.646-0.183,0.964
	C50.734,34.531,50.338,34.806,49.911,34.806z M44.851,30.699c-0.436,0-0.837-0.287-0.961-0.729c-0.15-0.531,0.158-1.084,0.69-1.233
	c0.779-0.22,1.597-0.286,2.386-0.18c0.547,0.074,0.931,0.577,0.857,1.125c-0.073,0.547-0.566,0.931-1.125,0.857
	c-0.521-0.069-1.058-0.023-1.575,0.121C45.032,30.687,44.942,30.699,44.851,30.699z"></path><path style="fill:#DD352E;" d="M40.844,11.931C40.32,7.932,38.23,2.75,30.022,2.75c-8.207,0-10.298,5.182-10.822,9.181
	c-0.287,2.192-0.126,4.419,0.33,6.582c2.509,11.893,8.71,19.022,10.177,20.577c0.172,0.182,0.458,0.182,0.63,0
	c1.467-1.555,7.668-8.684,10.177-20.577C40.971,16.35,41.132,14.123,40.844,11.931z M30.022,19.672
	c-3.505,0-6.346-2.841-6.346-6.346c0-3.505,2.841-6.345,6.346-6.345c3.505,0,6.346,2.841,6.346,6.345
	C36.368,16.831,33.527,19.672,30.022,19.672z"></path><g><path style="fill:#B02721;" d="M30.023,5.981c-4.051,0-7.346,3.295-7.346,7.345c0,4.051,3.295,7.346,7.346,7.346
		s7.346-3.295,7.346-7.346C37.368,9.276,34.073,5.981,30.023,5.981z M30.023,18.672c-2.947,0-5.346-2.398-5.346-5.346
		s2.398-5.345,5.346-5.345s5.346,2.397,5.346,5.345S32.97,18.672,30.023,18.672z"></path>
</g></svg></span>
        <p class="u-text u-text-6" ><a href="https://www.google.com.tw/maps/place/${reunion.place}" target="_blank">${reunion.place}</a></p><span class="u-file-icon u-icon u-icon-2"><img src="images/1235446.png" alt=""></span><span class="u-file-icon u-icon u-icon-3"><img src="images/4305512.png" alt=""></span><span class="u-file-icon u-icon u-icon-4"><img src="images/1769041.png" alt=""></span>
        <p class="u-text u-text-7">${reunion.pay.paytype}<span style="font-size: 1.125rem;"></span>
        </p>
        <p class="u-text u-text-8">${reunion.people}人</p>
        <p class="u-text u-text-default u-text-9">${reunion.budget}</p>
      </div>
    </section>
    <section class="u-align-center u-clearfix u-section-2" id="sec-39b4">
      <div class="u-clearfix u-sheet u-valign-middle u-sheet-1"></div>
    </section>

    
    
    			<!-- Bootstrap core JS-->
				<script src="${contextRoot}/js/bootstrap.bundle.min.js"></script>
				<script src="${contextRoot}/js/jquery-3.6.1.min.js"></script>
	
	<footer>
		<jsp:include page="/WEB-INF/layout/footer.jsp" />
	</footer>
  
</body></html>