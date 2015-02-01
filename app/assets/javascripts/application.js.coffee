//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$ ->
  pathname = window.location.pathname
  console.log(pathname)
  if pathname == '/teams'
    $('#teams-tab').addClass('active')
  if pathname == '/matches/new'
    $('#new-match-tab').addClass('active')
  if pathname == '/my_team'
    $('#my-team-tab').addClass('active')