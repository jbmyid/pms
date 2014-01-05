#= require application
#= require pie_chart
@todoDragable = ->
  $("span.devTodo").draggable
    appendTo: "body"
    helper: "clone"
  $("tr.state_rows" ).droppable
    drop: ( event, ui )-> 
      state = $(event.target).data("state")
      $.ajax
        url: ui.draggable.attr("data-statePath"),
        data: {state: state},
        dataType: "script"
$ ->
  todoDragable()