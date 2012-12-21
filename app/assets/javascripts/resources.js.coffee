$ ->
  $(".big_container_img img").load ->
    $.each $(".big_container_img img"), (index, value) ->
      $(value).css
        "top"         : "50%"
        "left"        : "50%"
        "margin-top"  : $(value).height() / -2
        "margin-left" : $(value).width() / -2
        "position"    : "absolute"

  $.each $(".big_container_img img"), (index, value) ->
    $(value).attr("src", $(value).attr("data-src"))