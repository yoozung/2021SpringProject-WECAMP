<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.work.wecamp.member.model.Member" %>
<%@ page import="com.work.wecamp.member.controller.MemberController" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <link rel="shortcut icon" href="/img/favicon.png">
	<link rel="icon" href="/img/favicon.png">
<title>초보자 가이드</title>


<link rel="stylesheet" href="/css/member/join.css">
<link rel="stylesheet" href="/css/member/join2.css">
<link rel="stylesheet" href="/css/header.css">
<link rel="stylesheet" href="/css/member/myInfo.css" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>

<body>
<!-- header 자리 -->
<jsp:include page="inc/header.jsp"></jsp:include>
<img src="/img/guide/guide.png" />
<div style = "padding: 5px 300px 2px 330px;">
<br><br>
<span style="background-color:#959595;">
   <span style="colof:#ffffff;">Writer 박신영 (아웃도어 매거진 기자)&nbsp;</span>
</span>
<p data-app="{"type":"text","data":[{"type":"text","text":"그동안 자유롭지 못했던 우리 아이들을 위해 엄마, 아빠가 나설 때가 왔다.
아이들과 캠핑을 떠나 봄을 만끽하는 것. 하지만 캠핑이 처음이라면? 어디서부터 어떻게 준비할지
막막한 초보 캠퍼를 위해 준비했다. 가족 캠핑 준비를 위한 A to Z."}]}" data-block-index="3"  data-shown="true">
그동안 자유롭지 못했던 우리 아이들을 위해 엄마, 아빠가 나설 때가 왔다.
아이들과 캠핑을 떠나 봄을 만끽하는 것. 하지만 캠핑이 처음이라면? 어디서부터 어떻게 준비할지
막막한 초보 캠퍼를 위해 준비했다. 가족 캠핑 준비를 위한 A to Z.</p>

<img src="/img/guide/guide2.png" />
<div class="inner_wrap"><hr></div>
<p data-app="{"type":"text","data":[{"type":"text","text":""캠핑 기본템, 어떤 것을 사야 할까""}]}" data-block-index="3"  data-shown="true" style="font-size:1.5em; text-align:center">
"캠핑 기본템, 어떤 것을 사야 할까"</p><br><br>

<p data-app="{"type":"text","data":[{"type":"text","text":"텐트 구매부터 설치까지"}]}" data-block-index="3"  data-shown="true">
<strong>"텐트 구매부터 설치까지"</strong></p>

<p data-app="{"type":"text","data":[{"type":"text","text":"어떤 텐트를
선택하느냐에 따라 캠핑의 흥망성쇠가 정해진다. 캠핑 중 텐트가 찢어지거나, 악천후에 비가 새면
대혼란에 빠지기 때문. 그뿐만 아니라 자고 일어났을 때 결로 현상으로 인해 텐트 내부가 온통
물난리라면, 이 또한 대환장 파티다. 초보 캠퍼는 텐트를 구매할 때 소재, 아이들을 위한
넓은 공간, 다양한 수납공간, 안전성, 간단한 설치법, 무게 등을 고려해야 한다. 기본 사항인
디자인과 가격도 물론 꼼꼼히 확인해야 한다."}]}" data-block-index="3"  data-shown="true">
어떤 텐트를
선택하느냐에 따라 캠핑의 흥망성쇠가 정해진다. 캠핑 중 텐트가 찢어지거나, 악천후에 비가 새면
대혼란에 빠지기 때문. 그뿐만 아니라 자고 일어났을 때 결로 현상으로 인해 텐트 내부가 온통
물난리라면, 이 또한 대환장 파티다. 초보 캠퍼는 텐트를 구매할 때 소재, 아이들을 위한
넓은 공간, 다양한 수납공간, 안전성, 간단한 설치법, 무게 등을 고려해야 한다. 기본 사항인
디자인과 가격도 물론 꼼꼼히 확인해야 한다.</p>

<img src="/img/guide/guide3.png" /><br><br>
<p data-app="{"type":"text","data":[{"type":"text","text":"텐트 설치할 때도 알아 두어야 할 점이 있다.
텐트를 설치하는 바닥은 크게 잔디, 노지, 파쇄석, 데크로 나뉜다. 텐트 구성 용품에는 텐트를 바닥에 고정하는 일반 펙(Peg)이
들어있는데, 이 펙은 잔디와 노지에서 사용 가능하다. 파쇄석, 해변, 눈밭에서는 두껍고 긴 단조펙을, 데크에서는 나사
모양의 스크류펙을 사용하는 게 좋다."}]}" data-block-index="3"  data-shown="true">
텐트 설치할 때도 알아 두어야 할 점이 있다.
텐트를 설치하는 바닥은 크게 잔디, 노지, 파쇄석, 데크로 나뉜다. 텐트 구성 용품에는 텐트를 바닥에 고정하는 일반 펙(Peg)이
들어있는데, 이 펙은 잔디와 노지에서 사용 가능하다. 파쇄석, 해변, 눈밭에서는 두껍고 긴 단조펙을, 데크에서는 나사
모양의 스크류펙을 사용하는 게 좋다.</p><br>

<img src="/img/guide/guide4.png" /><br><br>
<p data-app="{"type":"text","data":[{"type":"text","text":"망치나 캠핑용 해머를 구매하는 것도 추천한다.
보통 손, 발, 주벼의 돌로 펙을 고정하는데, 그럴 경우 펙이 구부러지거나 제대로 고정되지 않는다. 망치나 캠핑용 해머를
이용해 펙을 박으면 안전하고 빠르게 텐트를 설치할 수 있다."}]}" data-block-index="3"  data-shown="true">
망치나 캠핑용 해머를 구매하는 것도 추천한다.
보통 손, 발, 주벼의 돌로 펙을 고정하는데, 그럴 경우 펙이 구부러지거나 제대로 고정되지 않는다. 망치나 캠핑용 해머를
이용해 펙을 박으면 안전하고 빠르게 텐트를 설치할 수 있다.</p><br><br>

<p data-app="{"type":"text","data":[{"type":"text","text":""침낭, 충전재와 필파워를 확인하자""}]}" data-block-index="3"  data-shown="true" style="font-size:1.5em;">
<strong>침낭, 충전재와 필파워를 확인하자</strong></p>

<img src="/img/guide/guide5.png" />
<p data-app="{"type":"text","data":[{"type":"text","text":"침낭은 체온 유지를 유해 꼭 필요한 기본템이다.
아무리 여름이라고 해도 밤에 기온이 25도 이하로 내려가는 경우가 많기 때문이다. 따라서 아이가 있는 가족 캠퍼라면 더더욱
침낭을 준비해야한다. 침낭을 구매할 때는 침낭 안에 든 충전재를 확인해야 한다. 충전재는 크게 다운과 프리마로프트로
구분되는데, 가볍고 보온력이 우수한 충전재인 다운은 보통 솜털과 깃털을 섞어 사용한다. 다운 침낭의 스펙을 확인하면 
'90% 다운 10% 패더' 또는 '90:10'이라는 문구를 확인할 수 있는데, 이는 솜털과 깃털의 비율이다. 솜털의 비율이
높을 수록 보온성이 우수하다. '필파워(복원력)'도 확인하는 게 좋다. 필파워는 1온스(약 28g)의 다운을 압축한 후
풀었을 때 부풀어 오르는 정도다. 예를 들어 필파워가 800인 제품은 1온스의 다운으로 800세제곱 인치의 공간을 채운다.
핵심은 압축된 다운을 풀었을 때 얼마나 많이 부풀어 오르느냐다. 필파워 수치가 높을수록 따뜻하며 보통 필파워가 700
이상이면 좋은 제품이다. '프리마로프트'는 동물을 살상하지 않고 얻는 합성 소재로 친환경 시대 더욱 주목받는 충전재다.
프리마로프트는 보온력이 매우 우수하지만, 다운만큼 컴팩트한 수납이 어렵고 충전재가 자체가 풍성하게 부풀지 않는다."}]}" data-block-index="3"  data-shown="true">
침낭은 체온 유지를 유해 꼭 필요한 기본템이다.
아무리 여름이라고 해도 밤에 기온이 25도 이하로 내려가는 경우가 많기 때문이다. 따라서 아이가 있는 가족 캠퍼라면 더더욱
침낭을 준비해야한다.<br> 침낭을 구매할 때는 침낭 안에 든 충전재를 확인해야 한다. 충전재는 크게 다운과 프리마로프트로
구분되는데, 가볍고 보온력이 우수한 충전재인 다운은 보통 솜털과 깃털을 섞어 사용한다. 다운 침낭의 스펙을 확인하면 
'90% 다운 10% 패더' 또는 '90:10'이라는 문구를 확인할 수 있는데, 이는 솜털과 깃털의 비율이다. 솜털의 비율이
높을 수록 보온성이 우수하다.<br><br>'필파워(복원력)'도 확인하는 게 좋다. 필파워는 1온스(약 28g)의 다운을 압축한 후
풀었을 때 부풀어 오르는 정도다. 예를 들어 필파워가 800인 제품은 1온스의 다운으로 800세제곱 인치의 공간을 채운다.
핵심은 압축된 다운을 풀었을 때 얼마나 많이 부풀어 오르느냐다. 필파워 수치가 높을수록 따뜻하며 보통 필파워가 700
이상이면 좋은 제품이다.<br><br> '프리마로프트'는 동물을 살상하지 않고 얻는 합성 소재로 친환경 시대 더욱 주목받는 충전재다.
프리마로프트는 보온력이 매우 우수하지만, 다운만큼 컴팩트한 수납이 어렵고 충전재가 자체가 풍성하게 부풀지 않는다.</p><br><br>

<p data-app="{"type":"text","data":[{"type":"text","text":""어떤 매트리스를 선택할까""}]}" data-block-index="3"  data-shown="true" style="font-size:1.5em;">
<strong>어떤 매트리스를 선택할까</strong></p>

<img src="/img/guide/guide6.png" />
<p data-app="{"type":"text","data":[{"type":"text","text":"수면의 질은 바닥이 결정한다. '야외니까 이 정도는
감수하자'란 말은 아이들에게 통하지 않는 법. 아무리 평편한 곳에 텐트를 설치한다고 해도 바닥이 울퉁불퉁할 수밖에 없고,
밤이면 땅에서 냉기가 올라오기 때문에 매트리스는 캠핑 필수품이다. 매트리스 종류는 크게 발포, 에어, 자충(자동 충전) 매트리스
로 나뉜다. 계절에 따라서 매트리스 선택이 달라지는데, 겨울에는 자충 매트리스가 좋지만, 자충 매트리스가 없는 
경우에는 발포 매트리스 위에 에어 매트리스를 깔아 이중으로 사용하면 된다. 여름에는 발포 매트리스를 더 많이 사용
하지만 푹신한 바닥을 원한다면 에어나 자충 매트리스를 추천한다."}]}" data-block-index="3"  data-shown="true">
수면의 질은 바닥이 결정한다. '야외니까 이 정도는
감수하자'란 말은 아이들에게 통하지 않는 법. 아무리 평편한 곳에 텐트를 설치한다고 해도 바닥이 울퉁불퉁할 수밖에 없고,
밤이면 땅에서 냉기가 올라오기 때문에 매트리스는 캠핑 필수품이다. 매트리스 종류는 크게 발포, 에어, 자충(자동 충전) 매트리스
로 나뉜다. 계절에 따라서 매트리스 선택이 달라지는데, 겨울에는 자충 매트리스가 좋지만, 자충 매트리스가 없는 
경우에는 발포 매트리스 위에 에어 매트리스를 깔아 이중으로 사용하면 된다. 여름에는 발포 매트리스를 더 많이 사용
하지만 푹신한 바닥을 원한다면 에어나 자충 매트리스를 추천한다.</p>
<span style="color:#959595;">
   <b>발포 매트리스 : </b>
   촉감이 따뜻하고 야외에서 간편하게 사용할 수 있지만, 부피가 커서 휴대성이 좋지 않다.
</span><br><br>

<span style="color:#959595;">
   <b>에어 매트리스 : </b>
   컴팩트하게 피키징할 수 있어 휴대성이 좋고 냉기 차단 지수인 R밸류 역시 우수해 많은 캠퍼가 에어 매트리스를 사용한다.
   단점이라면 공기 주입식이라 바람을 넣고 빼는 수고로움이 있다. 노면이 매우 거친 곳에서 사용했을 때 표면에 구멍이 
   뚫릴 수도 있으니 주의해야 한다.
</span><br><br>

<span style="color:#959595;">
   <b>자충 매트리스 : </b>
   내부에 우레탄 소재를 충전해 마개를 열면 일정 부분 공기가 자동 주입된다. 에어 매트리스보다 설치 시간이 단출
   될 뿐만 아니라 발포 매트리스보다 냉기를 차단하는 효과가 좋다. 하지만 무겁고 부피가 커서 휴대성이 떨어진다.
</span><br><br>

<p data-app="{"type":"text","data":[{"type":"text","text":"처음부터 완벽하게 갖추지 않아도 된다. 
막막하고 어려워 보여도 일단 기본템부터 챙겨서 떠나보자. 캠핑하다 보변 우리 식구에게 어떤 장비가 필요한지 자연스럽
게 알게 될 테니 하나둘씩 추가해서 채워가면 된다."}]}" data-block-index="3"  data-shown="true">
처음부터 완벽하게 갖추지 않아도 된다. 
막막하고 어려워 보여도 일단 기본템부터 챙겨서 떠나보자. 캠핑하다 보변 우리 식구에게 어떤 장비가 필요한지 자연스럽
게 알게 될 테니 하나둘씩 추가해서 채워가면 된다.</p><br>

<div class="inner_wrap"><hr></div>
<p data-app="{"type":"text","data":[{"type":"text","text":"가족 캠핑하기 좋은 테마별 캠핑장 추천"}]}" data-block-index="3"  data-shown="true" style="font-size:1.5em; text-align:center">
가족 캠핑하기 좋은 테마별 캠핑장 추천</p><br><br>

<span>
   <b><strong>1. 숲<br>아버지의숲 산정캠프 </strong></b>
   - 전나무와 잣나무가 쭉쭉 뻗은 숲속 캠핑장. 넓은 부지의 테마별 캠핑존을 갖췄고, 산정호수를 보며 걷는 산책로가 매력적<br>
   <strong>주소 : </strong>경기 포천시 영북면 산정호수로 558-1
</span><br><br>

<span>
   <b><strong>2. 호수<br>대호레저펜션 </strong></b>
   - 캠퍼들 사이에서 '나만 알고 싶은 캠핑장'으로 손꼽히는 고즈넉한 차박 성지. 열개의 사이트를 갖춘 아담한 캠핑장
   이지만 고요한 충주호가 한눈에 펼쳐져 있다.<br>
   <strong>주소 : </strong>충북 충주시 동량면 미라실로 691
</span><br><br>

<span>
   <b><strong>3. 바다<br>마검포 힐링 캠핑장 </strong></b>
   - 오션뷰 맛집. 바다는 물론 넓은 소나무밭을 갖추어 다양한 액티비티를 즐길 수 있다.<br>
   <strong>주소 : </strong>충남 태안군 남면 마검포길 313-30
</span><br><br>

<span>
   <b><strong>4. 산<br>함허동천 야영장 </strong></b>
   - 마니산 자락에 있는 대규모 캠핑장. 211개의 사이트, 넓은 주차장, 다양한 편의시설을 갖췄다. 마니산 등산
   로와 연결돼 하이킹과 캠핑을 동시에 즐길 수 있다.<br>
   <strong>주소 : </strong>인천 강화군 화도면 해안남로1196번길 38
</span><br><br>
<a href="#" class="scrollToTop"></a>
<img src="/img/guide/guide7.png" />
</div><br/><br/>
<!-- 푸터자리 -->
<jsp:include page="inc/footer.jsp"></jsp:include>

<style>
		 .t-modal{
		 	height : 540px;
		 }
		 .t-navbar{
		 	margin-bottom : 50px;
		 }

</style>

</body>
</html>