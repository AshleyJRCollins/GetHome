import consumer from "./consumer";

const initRideCable = () => {
  const reviewContainer = document.querySelector('#review');
    if(reviewContainer) {
      const id = reviewContainer.dataset.rideId;
      console.log('id found', id)
      consumer.subscriptions.create({ channel: "RideChannel", id: id }, {
        received(data) {
          const map = document.getElementById('map');
          map.remove();
          const tripInProgress = document.getElementById('trip-in-progress');
          tripInProgress.remove();
          reviewContainer.insertAdjacentHTML('beforeend', data);
        },
    });
  }
}


export { initRideCable };
