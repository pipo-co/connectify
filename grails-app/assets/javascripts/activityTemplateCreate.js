
window.onload = function() {
    let placesAutocomplete = places({
        appId: 'pl1K18BJIY1N',
        apiKey: '516f768d0506c5c501c860ad045d4c3b',
        container: document.querySelector('#address')
    }).configure({
        type: 'address'
    });

    placesAutocomplete.on('change', function resultSelected(e) {
        document.querySelector('#lat').value = e.suggestion.latlng.lat || '';
        document.querySelector('#long').value = e.suggestion.latlng.lng || '';
    });
}