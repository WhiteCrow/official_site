//= require_tree .

mainColor = '#0088cc'
deepGray = 'rgba(26, 48, 58, 0.96)'

App =
  changeNavbarColor: ->
    $(window).on 'scroll', ->
      if $(document).scrollTop() > 634
        $('#page-nav').css('background-color', deepGray)
      else
        $('#page-nav').css('background-color', mainColor)
$ ->
  App.changeNavbarColor()
