$(function(){
	var tbody = $('#tbody');

	$.ajax({
		url: '/data/data.xml',
		dataType: 'xml',
		success: function(xml){
			var people = $(xml);

			people.find('person').each(function(){
				var person = $(this);

				var text_no = person.find('no').text();
				var text_name = person.find('name').text();
				var text_mail = person.find('mail').text();

				var tr = $('<TR />');
				var no = $('<TD />').text(text_no);
				var name = $('<TD />').text(text_name);
				var mail = $('<TD />').text(text_mail);

				tr.append(no);
				tr.append(name);
				tr.append(mail);
				tbody.append(tr);
			});
		}
	});
});