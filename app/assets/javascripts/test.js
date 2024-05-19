let map;

function initMap() {
  const position = { lat: 35.658581, lng: 139.745433 };
  map = new google.maps.Map(document.getElementById("custom-map"), {
    center: { lat: 35.658581, lng: 139.745433 },
    zoom: 8,
  });
  
  marker = new google.maps.Marker({
    position: position,
    map: map,
    title: "tokyo-tower",
  });

  marker.setOptions({
    icon: { 
      url: '/img/map_logo.png'
    }
  });
}

window.initMap = initMap;