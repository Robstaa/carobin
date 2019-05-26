jQuery(document).ready(function ($) {

  $(".scroll-link").click(function (event) {
    event.preventDefault();

    var defaultAnchorOffset = 0;

    var $anchor = $('#' + this.hash.substring(1));

    var anchorOffset = $anchor.data('anchor-offset');
    if (!anchorOffset) // for when anchor doesn't have the offset attribute like Section 4
      anchorOffset = defaultAnchorOffset;

    $('html,body').animate({
      scrollTop: $anchor.offset().top - anchorOffset
    }, 500);
  });
});