positionImages = ->
  img = $('.container_img img')
  height = img.height() / -2
  width = img.width() / -2
  
  if height < 150
    img.css 'margin-top', height + "px"
  else
    img.css 'margin-top', -height + "px"

  if height < 150
    img.css 'margin-left', width + "px"
  else
    img.css 'margin-left', -width + "px"


$ ->
 positionImages()
