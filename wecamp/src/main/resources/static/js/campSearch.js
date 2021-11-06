

const doBox = document.querySelector(".do-box");
const sigunguBox = document.querySelector(".sigungu-box");
const campsiteContainer = document.querySelector("#camp-list-container");
/** 고급검색 */
const campAdvBox = document.querySelector("#ans-2");
const advSearchBtn = document.querySelector("#camp-search-btn");	


	/* CSS 한번에 셋팅 */
	Element.prototype.setStyle = function(styles) {
    	for (var k in styles) this.style[k] = styles[k];
    	return this;
	};

	/** 페이지 로드시 도 이름 불러오기 */
	/** 페이지 로드시 전체 목록 10개 출력, 원래 데이터가 있다면 지우고 출력  */
	
	window.addEventListener("load",function(){
		
		localStorage.setItem('doNm','');
		
		/** 수정 필요 */
		var back = localStorage.getItem('back');
		var induty = document.querySelector("#induty").value;
		localStorage.setItem('induty',induty);
		getDoNm(doBox);
		
		console.log(back);
		/** 상세페이지에서 뒤로가기 눌렀을때 */
		if(typeof(back) == 'string'){
			if(back.indexOf('detail') > 0){
				getAllCampList(
				localStorage.getItem('sigungu'),
				localStorage.getItem('pageNo'),
				localStorage.getItem('campAdv')
				);
			
			localStorage.setItem('back','');
			return;
			
			}else{
				localStorage.clear();
				getAllCampList('',"1");
				return;
			}

		}else{
		if(localStorage.getItem("induty") != ''){
				var campAdvValue = {
				'campType' : [induty],
				'campLct' : [],
				'campSbrs' : [],
				'campThema' : [],
				'campEtc' : [],
				};
			
			localStorage.setItem('campAdv',JSON.stringify(campAdvValue));
			
			if(localStorage.getItem('pageNo') == null){
				
				getAllCampList('',"1",JSON.stringify(campAdvValue));
			}else{
				getAllCampList('',localStorage.getItem('pageNo'),JSON.stringify(campAdvValue));
			}
				
			localStorage.setItem('campAdv',JSON.stringify(campAdvValue));
			getAllCampList('',"1",JSON.stringify(campAdvValue));
				
		}else{
			console.log(localStorage.getItem('pageNo'));
			
			if(localStorage.getItem('pageNo') == null){
				getAllCampList('',"1",localStorage.getItem('campAdv'));
			}else{
				getAllCampList('',localStorage.getItem('pageNo'),localStorage.getItem('campAdv'));
			}
			
			return;
			}
		}
		
	
	})
	
	/** 캠핑장 리스트 불러오기  */
	function getAllCampList(sigun,pageNo,advValue){
		
		var doNm = localStorage.getItem('doNm');
		
		localStorage.setItem('sigungu',sigun);
		var sigungu = localStorage.getItem('sigungu');
		
		localStorage.setItem('pageNo',pageNo);
		
		const json = JSON.stringify({
				'doNm' : doNm,
				'sigungu' : sigungu,
				'page' : pageNo,
				'advValue' : advValue
		})
		
		/** 로딩박스 */
		var body = document.querySelector("body");
		var loading = document.querySelector(".loadingBox");
		
		axios.interceptors.request.use(
			function(config){
			
			body.style.background = "#e1e1e1";
			body.style.opacity = 0.8;
			loading.style.display = "block";
			
			
			return config;
			}
		)
		
		axios.interceptors.response.use(
			function(response){
				setTimeout(function(){
					
					body.style.background = "#fff";
					body.style.opacity = 1;
					loading.style.display = "none";
					
				},300);
				return response;
			}
		)
		
		axios({
			method:'POST',
			url:'/camp/all',
			data : json,
			headers : {
					'Content-Type' : 'application/json'
			},
			
		})
		.then(response =>{
			//console.log(response.data);
			window.scrollTo(0,100);
			campsiteContainer.innerHTML = response.data;
			
			
		})
		.catch(error => {
			console.log(error.response);
		})
	}
	
	
	

	function getDoNm(){
		
		axios({
			method:'POST',
			url : '/camp/donm',
			data: {}
		})	
		.then(response => {
			doBox.innerHTML = response.data;
		
			advUnCheck();
		})
		.catch(error =>{
			console.log(error);
		})
	}
	
	/** 도 출력 박스 선택 이벤트, 로컬 스토리지 저장 */
	function getSigungu(value){
		
		localStorage.clear();
		var doBox = document.querySelector('.do-box');
		
		/** 도 이름 클릭 시 이벤트 */
		doBox.onclick = function(e){
			
			if(e.target.nodeName != "INPUT") return;
			
			/** 도 이름 가져오기 */
			var doNm = value;
			
			/** 도 이름 로컬스토리지에 저장 */
			localStorage.setItem('doNm',doNm);
			
			/** DB접근 및 HTMl 출력 */
			useDoSigungu(doNm);
			
			
			advUnCheck();
			getAllCampList('','1');

		}
	}
	
	/** 시군구 DB 접근 및 HTML 출력  */
	function useDoSigungu(doNm){
		axios({
			method:'POST',
			url : '/camp/sigungu',
			data : 'doNm=' + doNm
		})
		.then(response => {
			sigunguBox.innerHTML = response.data;
		})
		.catch(error => {
			console.log(error);
		})
	}
	


	
	advSearchBtn.addEventListener("click",function(){
		
		/** 각 체크박스 가져오기 */
		var campTypeArr = document.getElementsByName("camp-type");
		var campLctArr = document.getElementsByName("camp-lct");
		var campSbrsArr = document.getElementsByName("camp-sbrs");
		var campThemaArr = document.getElementsByName("camp-thema");
		var campEtcArr = document.getElementsByName("camp-etc");
		

		var campAdvValue = {
			'campType' : [],
			'campLct' : [],
			'campSbrs' : [],
			'campThema' : [],
			'campEtc' : [],
		};
		
		
		for(var i=0; i < campTypeArr.length; i++){
			if(campTypeArr[i].checked == true){
				campAdvValue.campType.push(campTypeArr[i].value);
			}
		}
		
		for(var i=0; i < campLctArr.length; i++){
			if(campLctArr[i].checked == true){
				campAdvValue.campLct.push(campLctArr[i].value);
			}
		}
		
		for(var i=0; i < campSbrsArr.length; i++){
			if(campSbrsArr[i].checked == true){
				campAdvValue.campSbrs.push(campSbrsArr[i].value);
			}
		}		
		
		for(var i=0; i < campThemaArr.length; i++){
			if(campThemaArr[i].checked == true){
				campAdvValue.campThema.push(campThemaArr[i].value);
			}
		}	
				
		for(var i=0; i < campEtcArr.length; i++){
			if(campEtcArr[i].checked == true){
				campAdvValue.campEtc.push(campEtcArr[i].value);
			}
		}		
		
		/** 기존에 있던거 제거  */
		localStorage.setItem('campAdv','');
		localStorage.setItem('campAdv',JSON.stringify(campAdvValue));
		
		campAdvValue = localStorage.getItem('campAdv');
		
		getAllCampList(localStorage.getItem("sigungu"),1,campAdvValue)
	})

	function advUnCheck(){
		
		var optionBox = document.querySelector("#option-box");
		
		var checkBoxes = optionBox.querySelectorAll('input[type="checkbox"]'); 
		
		
		
		for(var i=0; i <checkBoxes.length; i++){
			checkBoxes[i].checked = false;
		}
	}	

/** 상세보기 */
/*수정*********************************************/
function detail(campsiteNo){
	

	
	
	
	
	location.href = "/camp/detail?campsiteNo=" + campsiteNo;
}

	
	
