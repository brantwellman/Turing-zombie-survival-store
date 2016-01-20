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
//= require jquery.turbolinks
//= require_tree .


// Setting up the map...
// Object containing LatLng and danger level for each outbreak.
var reported_outbreaks = {
  1: {
    center: {lat: 40.1074, lng: -105.2519},
    danger: 8
  },
  2: {
    center: {lat: 40.0314, lng: -105.2535},
    danger: 4
  },
  3: {
    center: {lat: 40.0284, lng: -105.2173},
    danger: 2
  },
  4: {
    center: {lat: 40.0894, lng: -105.3586},
    danger: 5
  },
  5: {
    center: {lat: 40, lng: -105.3416},
    danger: 5
  },
  6: {
    center: {lat: 39.7469, lng: -105.2108},
    danger: 4
  },
  7: {
    center: {lat: 39.5047, lng: -105.0814},
    danger: 2
  },
  8: {
    center: {lat: 39.7669, lng: -105.1108},
    danger: 4
  },
  9: {
    center: {lat: 39.869, lng: -104.7208},
    danger: 7
  },
  10: {
    center: {lat: 39.6969, lng: -104.8508},
    danger: 3
  },
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
      radius: (reported_outbreaks[outbreak].danger) * 800
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

$(document).ready(function() {
  $('select').material_select();
  $(".button-collapse").sideNav({
    edge: "right",
  });
});
