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

  
  # Render & Append the view when it is instantiated
  initialize: ->
    @render()
    $(".student").append @$el

  
  # Pass in the Student Template
  render: ->
    @$el.html studentTemplate(@model.attributes)

  
  # If Back is Clicked, clear Student View 
  back: ->
    $(".student").html ""
    $(".menu").html ""
    
    # Instantiate Menu View, call Thumbnail function to Instatiate View
    backMenu = new MenuView()
    backMenu.thumbnail()
)