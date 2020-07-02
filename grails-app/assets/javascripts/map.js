window.onload = function(){
   /* mapboxgl.accessToken = 'pk.eyJ1IjoiZmF1czI1MSIsImEiOiJja2M0c3hvc20wYjFnMzJ0NjY0aWRmYTBoIn0.V9qAOAnMha5Fx1GBNqDWcg';
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v11'
    });*/
    var mymap = L.map('mapid').setView([51.505, -0.09], 13);
    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: 'pk.eyJ1IjoiZmF1czI1MSIsImEiOiJja2M0c3hvc20wYjFnMzJ0NjY0aWRmYTBoIn0.V9qAOAnMha5Fx1GBNqDWcg'
    }).addTo(mymap);
    L.Map.invalidateSize();
}
