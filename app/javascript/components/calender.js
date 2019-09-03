import flatpickr from "flatpickr";
require("flatpickr/dist/themes/dark.css");

const toggleDateInputs = function() {
  flatpickr('#post_end_time', {
    enableTime: true,
    minDate: 'today',

  });
}

export { toggleDateInputs }
