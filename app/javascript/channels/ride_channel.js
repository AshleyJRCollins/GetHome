import consumer from "./consumer";

const initRideCable = () => {
  const reviewContainer = document.getElementById('review');
    const id = reviewContainer.dataset.rideId;

    consumer.subscriptions.create({ channel: "RideChannel", id: id }, {
      received(data) {
        "hello there"
        // reviewContainer.insertAdjacentHTML('beforeend', data);
      },
    });
}

export { initRideCable };
