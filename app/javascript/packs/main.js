document.addEventListener('DOMContentLoaded', () => {
    const links = document.querySelectorAll('#location');
    links.forEach(function(link){
      link.addEventListener('click', (event)=>{
        const { target } = event;
        const formData = new FormData(target);
        let name = formData.get("meetup_location[place_name]")
        let address = formData.get("meetup_location[place_address]")
        let rating = formData.get("meetup_location[place_rating]")
        let html = formData.get("meetup_location[place_html_attributions]")
        let place_id = formData.get("meetup_location[place_id]")
        document.getElementById("details-at-bottom").style.visibility = 'visible';
        document.getElementById("name").innerText = `${name}`
        document.getElementById("address").innerText = `${address}`
        document.getElementById("rating").innerText = `${rating}`
        // if(html !== undefined){
        //   document.getElementById("html").innerHTML = `${html}`
        // } else {
        //   document.getElementById("html").innerText = "Not available"
        // }
      });
    });
});
