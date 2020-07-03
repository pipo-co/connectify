var mymap;

function loadMarkers(activities){
    if(mymap === undefined){
        console.log("acaaaaaa");
        initializeMap();
    }
    activities.forEach(element =>{
        let marker = L.marker([element.latitude, element.longitude]).addTo(mymap);
        marker.bindTooltip(element.category);
        marker.bindPopup(`<b><a href='/activityTemplate/details/${element.id}'>${element.name}:</a></b>
        ${element.description},
        Duration: ${element.duration}`);
    });
}

function initializeMap() {
    mymap = L.map('mapid').setView([-34.603722, -58.381592], 15);

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

    mymap.locate({setView: true,  watch: true}) /* This will return map so you can do chaining */
        .on('locationfound', function(e){
            const marker = L.marker([e.latitude, e.longitude]).bindPopup('Your are here, check for activities around you');
            marker.bindTooltip('Your are here');
            const circle = L.circle([e.latitude, e.longitude], e.accuracy/2, {
                weight: 1,
                color: 'blue',
                fillColor: '#cacaca',
                fillOpacity: 0.2
            });
            mymap.addLayer(marker);
            mymap.addLayer(circle);
        })
        .on('locationerror', function(e){
            console.log(e);
            alert("Location access denied.");
        });






}
window.initializeMap = initializeMap;
window.loadMarkers = loadMarkers;
