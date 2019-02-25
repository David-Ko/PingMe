document.addEventListener('DOMContentLoaded', () => {
    const links = document.querySelectorAll('#location');
    links.forEach(function(link){
      link.addEventListener('mouseenter', (event)=>{
        const { target } = event;
        const formData = new FormData(target);
        let name = formData.get("meetup_location[place_name]")
        let address = formData.get("meetup_location[place_address]")
        let rating = formData.get("meetup_location[place_rating]")
        document.getElementById("details-at-bottom").style.visibility = 'visible';
        document.getElementById("name").innerText = `${name}`
        document.getElementById("address").innerText = `${address}`
        document.getElementById("rating").innerText = `${rating}`
        target.classList.add("white")
      });
    });
    links.forEach(function(link){
      link.addEventListener('mouseleave', (event)=>{
        const { target } = event;
        document.getElementById("details-at-bottom").style.visibility = 'hidden';
        target.classList.remove("white")
      });
    });

      document.querySelectorAll(".location-name").forEach(node => {
        node.addEventListener("mouseenter", event => {
            event.currentTarget.classList.add("white")
        });
        node.addEventListener("mouseleave", event => {
            event.currentTarget.classList.remove("white")
        });
    });
});
