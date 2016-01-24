$(document).on('ready page:load', function(){
	$('.rating').raty({path: '/assets/raty', scoreName: 'comment[rating]'});
	$('.rated').raty({path: '/assets/raty',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});

});

