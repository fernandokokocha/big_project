//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$ ->
  pathname = window.location.pathname
  console.log(pathname)
  if pathname == '/my_team'
    $('#my-team-tab').addClass('active')
  if pathname == '/teams'
    $('#teams-tab').addClass('active')
  if pathname == '/play_match'
    $('#play-match-tab').addClass('active')
  if pathname == '/admin'
    $('#admin-tab').addClass('active')