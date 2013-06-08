#  ___  _   ___ _    ___   _ _  _  ___  _ _ _ 
# |_ _|/ \ | o ) |  | __| | | || || __|| | | |
#  | || o || o \ |_ | _|  | V || || _| | V V |
#  |_||_n_||___/___||___|  \_/ |_||___| \_n_/ 

# Define Table View Constructor
window.TableView = Backbone.View.extend(
  
  # Wrap the view in a tr w/ class table-view
  tagName: "tr"
  className: "table-view"
  
  # Listen for a click on the mini icon
  events:
    "click .icon-envelope": "details"

  
  # Render & Append the view when it is instantiated
  initialize: ->
    
    #Show Appropriate Link to alternate view
    $(".table-button").hide()
    $(".thumbnail-button").show()
    @render()
    $(".table").append @$el

  
  # If a student is added make a new view (may need later)
  # this.listenTo(aprClass,'add', function(student){
  #   new TableView({
  #     model: student
  #   });
  # });
  
  # When rendering, Pass in the Student Template
  render: ->
    @$el.html tableTemplate(@model.attributes)

  
  # Clear Page and Instatiate Student view when mini icon is clicked 
  details: ->
    $(".table").html ""
    $(".menu-view").html ""
    
    #Instatiate view with model that was clicked
    new StudentViewT(model: @model)
)

#Manually Add the Student models to the class collection
aprClass.add [
  first_name: "Andrew"
  last_name: "McIntee"
,
  first_name: "Jen"
  last_name: "Ngetich"
]