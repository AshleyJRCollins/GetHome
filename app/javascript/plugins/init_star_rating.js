import "jquery-bar-rating";
import $ from 'jquery';

const initStarRating = () => {
  $('ratings').barrating({theme: 'css-stars'})
};

export { initStarRating };