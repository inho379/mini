	$(document).ready(function() {
		$('#search').click(function() {
			var t = {}
			t.sk = $('#sk').val()
			t.sv = $('#sv').val()
			t.list = "list"
			var request = $.ajax({
				url : "./h_search_html.jsp",
				method : "POST",
				data : t,
				dataType : "html"
			});

			request.done(function(data) {
				console.log(data)
				$("#table").html(data)
			});

			request.fail(function(jqXHR, textStatus) {
				alert("검색 실패!");
			});
		});
	});