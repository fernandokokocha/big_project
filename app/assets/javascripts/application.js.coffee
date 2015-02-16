//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$ ->
  pathname = window.location.pathname
  if pathname in ['/my_team', '/players', '/tactic', '/stadium', '/finance', '/matches']
    $('#my-team-tab').addClass('active')
  if pathname == '/admin'
    $('#admin-tab').addClass('active')
  if pathname == '/league'
    $('#league-tab').addClass('active')