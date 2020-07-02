var mymap;

window.onload = function(){
    if(mymap === undefined)
        initializeMap();
}

function loadMarkers(activities){
    if(mymap === undefined)
        initializeMap();
    activities.forEach(element =>{
        let marker = L.marker([element.latitude/10000, element.longitude/10000]).addTo(mymap);
        marker.bindPopup(`<a href="/activityTemplate/details/${element.id}">${element.name}</a>`).openPopup();
    })
}
function initializeMap(){
    mymap = L.map('mapid').setView([-34.603722,-58.381592], 13);

    L.tileLayer('https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}', {
        attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="https://www.mapbox.com/">Mapbox</a>',
        maxZoom: 18,
        id: 'mapbox/streets-v11',
        tileSize: 512,
        zoomOffset: -1,
        accessToken: 'pk.eyJ1IjoiZmF1czI1MSIsImEiOiJja2M0c3hvc20wYjFnMzJ0NjY0aWRmYTBoIn0.V9qAOAnMha5Fx1GBNqDWcg'
    }).addTo(mymap);

    setTimeout(() => {
        mymap.invalidateSize();
    }, 2000);

}

window.loadMarkers = loadMarkers;
