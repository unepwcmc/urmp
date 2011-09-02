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
      History.pushState({principle:id}, appName + " - " + name, "?principle=" + id);
    }
  };

  // Get URL params
  var getQueryParameter = function(parameterName) {
    var queryString = window.top.location.search.substring(1);
    var parameterName = parameterName + "=";
    if ( queryString.length > 0 ) {
      begin = queryString.indexOf ( parameterName );
      if ( begin != -1 ) {
        begin += parameterName.length;
        end = queryString.indexOf ( "&" , begin );
          if ( end == -1 ) {
          end = queryString.length
        }
        return unescape ( queryString.substring ( begin, end ) );
      }
    }
    return "null";
  }

  $(document).ready(function() {
    appName = $('title').html().split('Principle')[0];
    var currentPrinciple = getQueryParameter('principle');
    if (currentPrinciple !== 'null')
      togglePrinciplePanel($('#principle-'+currentPrinciple));

    $('ul.slide-list').delegate('div.title-box', 'click', function() {
      togglePrinciplePanel($(this).parent('li'));
      return false;
    });
  });
}).call(this);
