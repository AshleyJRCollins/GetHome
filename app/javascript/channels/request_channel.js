import consumer from "./consumer";

const initRequestCable = () => {
  const acceptContainer = document.getElementById('accept');
  if(acceptContainer) {
    const id = acceptContainer.dataset.requestId;
    consumer.subscriptions.create({ channel: "RequestChannel", id: id }, {
      received(data) {
        console.log('received data request channel', id)
        const cancelBooking = document.getElementById('cancel-booking');
        cancelBooking.remove();
        acceptContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initRequestCable };
