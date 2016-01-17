// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// Setting up the map...
// Object containing LatLng and danger level for each outbreak.
var reported_outbreaks = {
  boulder: {
    center: {lat: 40.0274, lng: -105.2519},
    danger: 8
  },
  golden: {
    center: {lat: 39.7469, lng: -105.2108},
    danger: 4
  },
  lakewood: {
    center: {lat: 39.7047, lng: -105.0814},
    danger: 2
  }
};

var safehouses = {
  turing: {
    center: {lat: 39.749635, lng: -105.000106}
  }
};

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.7392, lng: -104.9903},
    zoom: 10
  });

  // Construct the circle for each reported_outbreak scale by danger.
  for (var outbreak in reported_outbreaks) {
    var outbreakCircle = new google.maps.Circle({
      strokeColor: '#FF0000',
      strokeOpacity: 0.8,
      strokeWeight: 2,
      fillColor: '#FF0000',
      fillOpacity: 0.35,
      map: map,
      center: reported_outbreaks[outbreak].center,
      radius: (reported_outbreaks[outbreak].danger) * 1000
    });
  }

  for (var safehouse in safehouses) {
    var image = {
        url: '/assets/Green_flag_waving.svg',
        scaledSize : new google.maps.Size(22, 32)
    };
    var safehouseMarker = new google.maps.Marker({
    position: safehouses[safehouse].center,
    map: map,
    icon: image,
    });
  };
};

// Haven't gotten heatmap to work yet.

var heatmap = new google.maps.visualization.HeatmapLayer({
  data: heatmapData
});
heatmap.setMap(map);

var heatmapData = [
  new google.maps.LatLng(40.0274, -105.2560),
  new google.maps.LatLng(40.0275, -105.2558),
  new google.maps.LatLng(40.0276, -105.2546),
  new google.maps.LatLng(40.0277, -105.2539),
  new google.maps.LatLng(40.0278, -105.2528),
  new google.maps.LatLng(40.0374, -105.2560),
  new google.maps.LatLng(40.0375, -105.2558),
  new google.maps.LatLng(40.0376, -105.2546),
  new google.maps.LatLng(40.0377, -105.2539),
  new google.maps.LatLng(40.0378, -105.2528),
  new google.maps.LatLng(40.0274, -105.2660),
  new google.maps.LatLng(40.0275, -105.2658),
  new google.maps.LatLng(40.0276, -105.2646),
  new google.maps.LatLng(40.0277, -105.2639),
  new google.maps.LatLng(40.0278, -105.2728),
  new google.maps.LatLng(40.0374, -105.2760),
  new google.maps.LatLng(40.0375, -105.2758),
  new google.maps.LatLng(40.0376, -105.2746),
  new google.maps.LatLng(40.0377, -105.2739),
  new google.maps.LatLng(40.0378, -105.2728)
];

function toggleHeatmap() {
  heatmap.setMap(heatmap.getMap() ? null : map);
};
