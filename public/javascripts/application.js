// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

(function() {
  var togglePrinciplePanel;
  togglePrinciplePanel = function(li) {

    if (li.hasClass('active')) {
      li.find('div.block').slideUp();
      li.removeClass('active');
    } else {
      li.find('div.block').slideDown();
      li.addClass('active');

      //Set history
      var id = li.attr('id').split('principle-')[1];
      var name = 'Principle ' + id;
      if (id === '0'){
        name = 'All Principles'
      }
      History.pushState({principle:id}, appName + " - " + name, "?priciple=" + id);
    }
  };
  $(document).ready(function() {
    appName = $('title').html().split('Principle')[0];
    $('ul.slide-list').delegate('div.title-box', 'click', function() {
      togglePrinciplePanel($(this).parent('li'));
      return false;
    });
  });
}).call(this);
