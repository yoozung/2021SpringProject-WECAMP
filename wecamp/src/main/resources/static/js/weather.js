/** cb215db936c04dd1829d7bf42386ac5c */


window.addEventListener("load",function(){
	
	/** 받아올 정보값  */
	let weatherDo = document.querySelector("#doNm").value;
	let weatherSigungu =document.querySelector("#sigungu").value;
	let lat = document.querySelector("#lat").value;
	let lon = document.querySelector("#lon").value;
	
	var endpoint ="https://api.openweathermap.org/data/2.5/onecall?";
	endpoint = endpoint.concat("lat=",
					/** 수정 */
					lat,
					"&lon=",
					/** 수정 */
					lon,
					"&exclude=dayily&units=metric&appid=cb215db936c04dd1829d7bf42386ac5c");
	

	
	axios({
		method : "GET",
		url : endpoint,
		data : {},
		headers : {
			'Content-type' : 'application/x-www-form-urlencoded'
		}
	})
	.then(response =>{	
		var weatherArr = response.data.daily;
		console.log(weatherArr);
		
		
		/** 아이콘 */
		
		var icon = 'http://openweathermap.org/img/wn/'
		let weatherBox = document.querySelector("#weather-box");
		
		for(var i = 0; i < weatherArr.length-2; i++){
			
			console.log(Math.floor(weatherArr[i].temp.max));
			console.log(Math.floor(weatherArr[i].temp.min));
			console.log(moment().add(i,'d').format('MM/DD'));
			console.log(icon);
			
			if(i == 0){
				var icon = 'http://openweathermap.org/img/wn/'+ weatherArr[i].weather[0].icon + '@2x.png';
				let todayWeather = weatherBox.querySelector(".card-1");
				todayWeather.querySelector(".temp").innerHTML =
							 Math.floor(weatherArr[i].temp.max) + "&deg / " + Math.floor(weatherArr[i].temp.min) + "&deg;";
				
				todayWeather.querySelector(".location").innerHTML = 
							"&nbsp;  " + weatherDo +" , " +  weatherSigungu;
				
				todayWeather.querySelector("img").setAttribute("src",icon);
							
			}
			
			if(i != 0){
				var icon = 'http://openweathermap.org/img/wn/'+ weatherArr[i].weather[0].icon + '@2x.png';
				todayWeather = weatherBox.querySelector(".card-3").querySelector(".row")
				.querySelectorAll(".col");
				
				todayWeather[i-1].querySelector("img").setAttribute("src",icon);
				todayWeather[i-1].querySelector(".row.row1").innerHTML = 
								Math.floor(weatherArr[i].temp.max)+ "&deg";
								
				todayWeather[i-1].querySelector(".row.row3").innerHTML = 
				moment().add(i,'d').format('MM/DD');
				
			}
				
		}
		
	})
	
	.catch(error => {
		console.log(error.response);
	})
	
})



