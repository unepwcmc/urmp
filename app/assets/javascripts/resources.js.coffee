positionImg = ->
  imgs = $('.big_container_img img')

  imgs.load ->
    $.each imgs, (index, value) ->
      img = $(value)
      height = img.height() / -2
      width = img.width() / -2

      if height < 200
        img.css 'margin-top', height + "px"
      else
        img.css 'margin-top', -height + "px"

      if width < 250
        img.css 'margin-left', width + "px"
      else
        img.css 'margin-left', -width + "px"

$ ->
  positionImg()
