import GMaps from 'gmaps/gmaps.js';
import { autocomplete } from '../components/autocomplete';

const mapElement = document.getElementById('map');

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(mapElement.dataset.markers);

  const styles = [
           {
              featureType: 'water',
              stylers: [
                { color: '#19a0d8' }
              ]
            },
            {
              featureType: 'administrative',
              elementType: 'labels.text.stroke',
              stylers: [
                { color: '#ffffff' },
                { weight: 6 }
              ]
            },
            {
              featureType: 'administrative',
              elementType: 'labels.text.fill',
              stylers: [
                { color: '#006080' } //name of the city
              ]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry.stroke',
              stylers: [
                { color: '#3a3735' }, //changed edges of roads along
                { lightness: -40 }
              ]
            },
            {
              featureType: 'transit.station',
              stylers: [
                { weight: 9 },
                { hue: '#669999' }
              ]
            },
            {
              featureType: 'road.highway',
              elementType: 'labels.icon',
              stylers: [
                { visibility: 'off' }
              ]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.stroke',
              stylers: [
                { lightness: 100 }
              ]
            },
            {
              featureType: 'water',
              elementType: 'labels.text.fill',
              stylers: [
                { lightness: -100 }
              ]
            },
            {
              featureType: 'poi',
              elementType: 'geometry',
              stylers: [
                { visibility: 'on' },
                { color: '#5f9071' } // darker green - parks
              ]
            },
            {
              featureType: 'road.highway',
              elementType: 'geometry.fill',
              stylers: [
                { color: '#efe9e4' },
                { lightness: -25 }
              ]
            }];

    map.addStyle({
      styles: styles,
      mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
  // end of style of the map

  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  }
  else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(16);
  }
  else {
    map.fitLatLngBounds(markers);
  }
}


autocomplete();


// 1. added autocomplete - import and run
// 2. changed style -> needst to be between code
