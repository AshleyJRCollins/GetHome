import consumer from "./consumer";

const initRequestCable = () => {
  const acceptContainer = document.getElementById('accept');
    const id = acceptContainer.dataset.requestId;

    consumer.subscriptions.create({ channel: "RequestChannel", id: id }, {
      received(data) {
      // called when data is broadcast in the cable
        acceptContainer.insertAdjacentHTML('afterbegin', data);
      },
    });
  // }
}

export { initRequestCable };
