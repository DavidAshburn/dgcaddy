function initMap() {
  
  navigator.geolocation.getCurrentPosition(position => {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    const you = {
      lat: lat,
      lng: lon
    };
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 10,
      center: you
    });

    const selfmark = new google.maps.Marker({
      position: {
        lat: lat,
        lng: lon
      },
      map: map
    });
  });
}
                    
window.initMap = initMap;