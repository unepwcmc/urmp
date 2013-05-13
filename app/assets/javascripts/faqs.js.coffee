isElementInViewport = (el) ->
  rect = el.getBoundingClientRect()

  return (rect.top >= 0 &&
          rect.left >= 0 &&
          rect.bottom <= (window.innerHeight || document. documentElement.clientHeight) &&
          rect.right <= (window.innerWidth || document. documentElement.clientWidth))

$(document).ready ->
  id = window.location.hash.replace('faq_', '')
  $('html, body').scrollTop $("#{id}").offset().top

  $(window).scroll () ->
    h4_elements = $('.content .main h4')
    h4 = undefined

    h4_elements.each (el) ->
      if isElementInViewport(this)
        h4_div = $(this).find('~ div')[0]
        if h4_div && isElementInViewport(h4_div)
          h4 = this
          return false

    if h4
      window.location.hash = "faq_#{$(h4).attr('id')}"
