$( document ).ready(function() {
	$('#calendar').fullCalendar({
        events: 		window.location.href,
        eventClick: function(calEvent, jsEvent, view) {
							        $('#new_event_modal').modal('show');
							        $('#event_name').val(calEvent.title);
							        $('#event_start_time').val(moment(calEvent.start._i).format("YYYY-MM-DD[T]HH:mm"));
							        $('#event_end_time').val(moment(calEvent.end._i).format("YYYY-MM-DD[T]HH:mm"));
							        $('event_description').val(calEvent.description);
							        // room_id.val(calEvent.room_id);


	    }
	});

	$('#event_modal_btn').on('click', function() {
    $('#event_name').val("");
    $('#event_start_time').val("");
    $('#event_end_time').val("");
    $('event_description').val("");
    // room_id.val("");
	})

});


