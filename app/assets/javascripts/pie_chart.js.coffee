@ApiChart = (stats)->
  this.stats = stats
  drawChart = ->
    data = google.visualization.arrayToDataTable(stats)
    options = title: "My Daily Activities"
    chart = new google.visualization.PieChart(document.getElementById("piechart"))
    chart.draw data, options
  google.load "visualization", "1",
    packages: ["corechart"]
  google.setOnLoadCallback drawChart
  this
