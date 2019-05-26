jQuery(document).ready(function ($) {
  $(".flash").click(function (event) {
    $(event.target).addClass('clicked');
  });
});