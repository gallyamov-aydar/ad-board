$(document).on('turbolinks:load', function() {

  var adsArr = $('.word-wrap');

	for (var i = 0; i < adsArr.length; i++) {
		var text = adsArr[i].innerHTML,
				char = 160 // Максимум символов
		
		if (text.length > 160) {
				do {
				char--;
			} while (text.charAt(char) != ' ')

			adsArr[i].innerHTML = text.substr(0, char);
		}	
	}
});