#  __  ___  _ _  __  ___  _  _  ___   _ _  _  ___  _ _ _ 
# / _||_ _|| | ||  \| __|| \| ||_ _| | | || || __|| | | |
# \_ \ | | | U || o ) _| | \\ | | |  | V || || _| | V V |
# |__/ |_| |___||__/|___||_|\_| |_|   \_/ |_||___| \_n_/ 

# (From Thumbnail View)

# Make a View Constructor
window.StudentViewTh = Backbone.View.extend(
  
  # Wrap the view in a div called studentview
  tagName: "div"
  className: "student-view"
  
  # Listen for a click on the back button
  events:
    "click .back": "back"
    "click .edit": "edit"
    "click .cancel": "cancel"
    "click .save": "save"

  
  # Render & Append the view when it is instantiated
  initialize: ->
    console.log "im initializing", @model.attributes
    @render()
    $(".student").append @$el

  
  # Pass in the Student Template
  render: ->
    @$el.html studentTemplate(@model.attributes)
    console.log "im rendering", @model.attributes

  
  # If Back is Clicked, clear Student View 
  back: ->
    $(".student").html ""
    $(".menu").html ""
    
    # Instantiate Menu View, call Thumbnail function to Instatiate View
    backMenu = new MenuView()
    backMenu.thumbnail()

  edit: ->
    console.log "im editing", @model.attributes
    @$el.html updateTemplate(@model.attributes)

  cancel: ->
    @$el.html studentTemplate(@model.attributes)

  save: ->
    # @model.set photo: @$el.find(".photo-input").val("https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQdUtHnZ2NbfZBQI6RGcaA6LZDEJ-VQ0cJoropCetw9JlZ2PyKS")  if @$el.find(".photo-input").val() is ""
    # @model.set first: @$el.find(".first-input").val("Unknown")  if @$el.find(".first-input").val() is ""
    @model.set
      first_name: @$el.find(".first-input").val()
      last_name: @$el.find(".last-input").val()
      # github: @$el.find(".github-input").val()
      # email: @$el.find(".email-input").val()
      # photo: @$el.find(".photo-input").val()

    @$el.html studentTemplate(@model.attributes)
)