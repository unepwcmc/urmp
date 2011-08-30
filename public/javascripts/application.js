// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

(function() {
  var togglePrinciplePanel;
  togglePrinciplePanel = function(element) {
    var li = $(element).parent('li');
    if (li.hasClass('active')) {
      li.find('div.block').slideUp();
      li.removeClass('active');
    } else {
      li.find('div.block').slideDown();
      li.addClass('active');
    }
  };
  $(document).ready(function() {
    $('ul.slide-list').delegate('div.title-box', 'click', function() {
      togglePrinciplePanel(this);
      return false;
    });
  });
}).call(this);
