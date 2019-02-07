import appKey from "../../../keys"
document.addEventListener('DOMContentLoaded', () => {
    const form = document.querySelector('#search');
    form.addEventListener('submit', (event) => {
        event.preventDefault();
        const { currentTarget } = event;
        const formData = new FormData(currentTarget);
        console.log(formData)
        let venue = formData.get("venue")
        let distance = formData.get("distance")
        let lng = formData.get("longitude")
        let lat = formData.get("latitude")
        console.log(venue)
        console.log(distance)
        console.log(`longitude: ${lng}`)
        console.log(`latitude: ${lat}`)
        fetch(`https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${lat},${lng}&radius=${distance}&type=${venue}&keyword=${venue}&key=${appKey}`, 
        {
            method: "GET",
            headers: {
              "Content-Type": "application/json",
            }
          })
        .then(res=>res.json())
        .then(data=>console.log(data))
    });
})
