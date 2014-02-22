Bandango.DashboardSummaryChartView = Ember.View.extend
  templateName: "dashboard/summary_chart"
  classNames: "summary_chart margin_top".w()
  modelBinding: "controller.model"

  didInsertElement: ->
    @$().highcharts
      title:
        text: "Compras - Ventas #{@get("model.chart.interval")}"
      xAxis:
        categories: @get("model.chart.categories")
      yAxis:
        labels:
          format: "$ {value}"
        title:
          text: null
      series: @get("model.chart.series")
      tooltip:
        valuePrefix: "$ "
      legend:
        layout: "vertical"
        borderWidth: 0
        align: "right"
        verticalAlign: "middle"
