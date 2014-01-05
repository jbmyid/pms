@ApiChart = (params)->
  drawChart = ->
    console.log options
    data = google.visualization.arrayToDataTable(params.data)
    options = title: params.title
    chart = new google.visualization.PieChart(document.getElementById(params.id))
    chart.draw data, options
  google.load "visualization", "1",
    packages: ["corechart"]
  google.setOnLoadCallback drawChart
  this
