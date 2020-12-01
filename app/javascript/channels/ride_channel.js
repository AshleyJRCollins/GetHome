import consumer from "./consumer";

const initRideCable = () => {
  const reviewContainer = document.getElementById('review');
    const id = reviewContainer.dataset.rideId;
  console.log('Hi there')

    consumer.subscriptions.create({ channel: "RideChannel", id: id }, {
      received(data) {
        "hello there"
        // reviewContainer.insertAdjacentHTML('beforeend', data);
        const tripInProgress = document.getElementById('trip-in-progress');
        tripInProgress.remove();
        reviewContainer.insertAdjacentHTML('beforeend', data);
      },
    });
}

export { initRideCable };
