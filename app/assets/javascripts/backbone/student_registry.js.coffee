#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

window.StudentRegistry =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

#Instatiate Menu View on page load
$(document).ready ->
  MenuViewOrigin = new MenuView()


