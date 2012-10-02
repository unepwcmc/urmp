//// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//
//= require_self
//

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
    var key_val, param, params, _i, _len;
    // Get all params
    params = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');

    // For each key=val
    for (_i = 0, _len = params.length; _i < _len; _i++) {
      param = params[_i];
      key_val = param.split('=');

      // If it's the parameter we're after, return it
      if (key_val[0] === parameterName) {
        var result = key_val[1].split('#')[0];
        return result;
      }
    }
    return "";
  }

  $(document).ready(function() {
    appName = $('title').html().split('Principle')[0];
    var currentPrinciple = getQueryParameter('principle');
    if (currentPrinciple !== '')
      togglePrinciplePanel($('#principle-'+currentPrinciple));

    $('ul.slide-list').delegate('div.title-box', 'click', function() {
      togglePrinciplePanel($(this).parent('li'));
      return false;
    });
  });
}).call(this);
