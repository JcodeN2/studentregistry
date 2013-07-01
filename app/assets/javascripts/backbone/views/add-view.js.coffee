# For adding and updating students
# Define Update View Constructor
window.AddView = Backbone.View.extend(
  
  #Wrap view in div w/ class update-view
  tagName: "div"
  className: "update-view"
  events:
    "click .save": "save"
    "click .cancel": "cancel"

  initialize: ->
    @render()
    $(".add-new").append @$el

  render: ->
    @$el.html addTemplate()

  save: ->
    $(".add-button").show()
    # @$el.find(".photo-input").val "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQdUtHnZ2NbfZBQI6RGcaA6LZDEJ-VQ0cJoropCetw9JlZ2PyKS"  if @$el.find(".photo-input").val() is ""
    @$el.find(".first-input").val "Unknown"  if @$el.find(".first-input").val() is ""
    aprClass.create (
      first_name: @$el.find(".first-input").val()
      last_name: @$el.find(".last-input").val()
      # github: @$el.find(".github-input").val()
      # email: @$el.find(".email-input").val()
      # photo: @$el.find(".photo-input").val()
    )
    $(".add-new").html ""
    $(".add-button").show()
    $(".table").html ""
    $(".class-th").html ""
    $(".menu-view").html ""
    alert "Added new student"
    new MenuView()

  cancel: ->
    $(".add-new").html ""
    $(".add-button").show()
    $(".table").html ""
    $(".class-th").html ""
    $(".menu-view").html ""
    new MenuView()
)