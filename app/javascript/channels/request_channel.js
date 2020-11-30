import consumer from "./consumer";

const initRequestCable = () => {
  const acceptContainer = document.getElementById('accept');
    const id = acceptContainer.dataset.requestId;

    consumer.subscriptions.create({ channel: "RequestChannel", id: id }, {
      received(data) {
      // called when data is broadcast in the cable
        const cancelBooking = document.getElementById('cancel-booking');
        cancelBooking.remove();
        acceptContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  // }
}

export { initRequestCable };
