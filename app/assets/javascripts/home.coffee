# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('.description').each (index, ele) ->
		$(ele).hide()
	$('button.description-btn').click (e) ->
		id = $(e.target).attr('data-target')
		$(id).toggle(300)
