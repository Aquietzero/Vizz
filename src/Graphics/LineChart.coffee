
# LineChart.coffee is for line charts in 3D. The data source
# can be array-based or object-based.
# 
# @author zero / zhaoyunhaosss@gmail.com
#

Vector3 = @Vizz.Core.Vector3
Range   = @Vizz.Core.Range
Curve   = @Vizz.Core.Curve
Scaler  = @Vizz.Core.Scaler
Segment = @Vizz.Primitive.Segment
Sphere  = @Vizz.Primitive.Sphere
Graph   = @Vizz.Graphics.Graph

class LineChart extends Graph

  CONFIG:
    basic : null # Default to be the configuration of the line chart elements.
    curve : new Curve( ( -> 0), 'CARTESIAN', new Range(-6, 6), 0.01 )
    range : new Range(-220, 220)
    type  : 'SOLID'

  constructor: (@raw_data, @renderer, config) ->
    @setConfig config, @CONFIG
    super()

    @onCurve()

  # Process data with specific configuration.
  process: ->
    # Get the points on the curve for rendering each piece of data
    # within the given range.
    stops = @CONFIG.curve.stops(@raw_data.length)
    @CONFIG.curve.scale(stops, @CONFIG.range)

    @render_data = (pos: stops[i], val: @raw_data[i] for i in [0...@raw_data.length])

  # Render the processed data.
  render: ->
    for i in [1...@render_data.length]
      pos_curr = @render_data[i-1].pos
      pos_next = @render_data[i].pos
      val_curr = @render_data[i-1].val
      val_next = @render_data[i].val

      segment = new Segment(
        new Vector3(pos_curr.x, val_curr, pos_curr.z),
        new Vector3(pos_next.x, val_next, pos_next.z),
        @CONFIG.basic.line
      )

      switch @CONFIG.type
        when 'SOLID'  then segment.solid()
        when 'DOTTED' then segment.dotted()

      point = new Sphere(
        x:pos_curr.x
        y:val_curr
        z:pos_curr.z,
        @CONFIG.basic.point
      )
      @renderer.add segment
      @renderer.add point

      # Only points represent the data.
      @graph_data.push point


@Vizz.Graphics.LineChart = LineChart
