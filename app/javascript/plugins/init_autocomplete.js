import places from 'places.js';

const initAutocomplete = () => {
  const start_address = document.getElementById('request_starting_location');
  if (start_address) {
    places({ container: start_address });
  }

    const end_address = document.getElementById('request_ending_location');
  if (end_address) {
    places({ container: end_address });
  }
};

export { initAutocomplete };
