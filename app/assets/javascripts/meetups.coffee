$(document).ready ->
	$('.description').each (index, ele) ->
		$(ele).hide()
	$('.description-btn').click (e) ->
		id = $(e.target).attr('data-target')
		faElement = $(this).children()[0]

		$(id).toggle(300, ()-> (
			faElement.classList.toggle('fa-chevron-down')
			faElement.classList.toggle('fa-chevron-up')
		))
