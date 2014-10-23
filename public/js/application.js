$(document).ready(function() {
	$('#add_comment').submit(function(event) {
		event.preventDefault()
		var url = $(this).attr("action");
		var commentContent = $(this).serialize();
		$(this)[0].reset();
		console.log(url)
		console.log(commentContent)
		$.ajax({
			type: "POST",
			url: url,
			data: commentContent
		})
		.done(function(response) {
			console.log("reached here")
			console.log(response)
			$('.comment_list').prepend(response);
		});
	});
});
