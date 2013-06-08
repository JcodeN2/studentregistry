#  _   _  ___  _  _  _ _   _ _  _  ___  _ _ _ 
# | \_/ || __|| \| || | | | | || || __|| | | |
# | \_/ || _| | \\ || U | | V || || _| | V V |
# |_| |_||___||_|\_||___|  \_/ |_||___| \_n_/ 

# Define Menu View Constructor
window.MenuView = Backbone.View.extend(
  
  # Wrap the view in a div w/ class menu-view
  tagName: "div"
  className: "menu-view"
  
  # Listen for a click on view buttons
  events:
    "click .table-button": "table"
    "click .thumbnail-button": "thumbnail"

  initialize: ->
    
    #define templates for each view    
    window.menuTemplate = JST["backbone/templates/menu-template"]
    window.thumbnailTemplate = JST["backbone/templates/thumbnail-template"]
    window.tableTemplate = JST["backbone/templates/table-template"]
    window.studentTemplate = JST["backbone/templates/student-template"]
    
    # Render & Append the view when it is instantiated
    @render()
    $(".menu").append @$el
    
    # If a student is added make a new view
    aprClass.each (student) ->
      new TableView(model: student)


  
  # When rendering, Pass in the Student Template
  render: ->
    @$el.html menuTemplate()

  
  # Clear page and instatiate table view when table is clicked
  table: ->
    $(".class-th").html ""
    
    #loop through class collection, make view for each model
    aprClass.each (student) ->
      new TableView(model: student)


  
  # Clear page and instatiate thumbnail view when thumbnail is clicked
  thumbnail: ->
    $(".table-view").html ""
    $(".class-th").html ""
    
    #loop through class collection, make view for each model
    aprClass.each (student) ->
      new ThumbnailView(model: student)

)

# //Instatiate Menu View on page load
# $(document).ready(function(){
#     var MenuViewOrigin = new MenuView();
# });