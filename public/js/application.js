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

	var count = 12

  $('#load_more').on("click", function(event) {
    event.preventDefault()
    console.log(count)

    $.ajax({
      type: "POST",
      url: '/',
      data: {"count": count}
    })
    .done(function(response) {
      count += 4;
      messages = jQuery.parseJSON(response)


      for (var i = 0; i < messages.length; i++) {
        $('#page_bottom').append(response)
      }
      console.log(messages)
    })
  })


	// setTimeout(function(){
	// 	$(window).scroll(function () {
	// 		if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
	// 			getArticles()
	// 		}
	// 	})
	// },500);

 //  var count = 12

 //  var getArticles = function() {
 //    console.log(count)

 //    $.ajax({
 //      type: "POST",
 //      url: '/',
 //      data: {"count": count}
 //    })
 //    .done(function(response) {
 //      count += 4;
 //      messages = jQuery.parseJSON(response)


 //      for (var i = 0; i < messages.length; i++) {
 //        $('#page_bottom').append(response)
 //      }
 //      console.log(messages)
 //    })
 //  }
})









// $(document).ready(function() {
//   var startLoad = 51
//       setTimeout(function(){
//   $(window).scroll(function () {
//     if ($(document).height() <= $(window).scrollTop() + $(window).height()) {
//          getMessages()
//     }
//   })
// },500);

// var getMessages = function(){
//   $.ajax({
//     type: "GET",
//     url: "/inbox/"+ startLoad+""
//   }).done(function(response){
//       console.log("BAM")
//       messages = jQuery.parseJSON(response)
//       for (var i = 0; i < messages.length; i++){
//         // console.log(response)
//         console.log(messages)
//         // $('#inbox_table').append(response)
//         // $('#inbox_table').append("<li 'class=ajax"+[i]+"'>"+ (startLoad + i) + ". " + "<a href='/messages/" + messages[i].id + "'>" + messages[i].subject+"</a></li>")
//       }
//       startLoad += 10
//   })



















