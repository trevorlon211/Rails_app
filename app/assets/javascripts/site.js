$(document).on('ready page:load', function(){
	$('.rating').raty({path: '/assets/raty', scoreName: 'comment[rating]'});
	$('.rated').raty({path: '/assets/raty',
		readOnly: true,
		score: function() {
			return $(this).attr('data-score');
		}
	});
});

var map;
   function initMap() {
   map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 40.7383593, lng: -73.9863218},
  });
 }