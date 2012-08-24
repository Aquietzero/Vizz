
# LineChart.coffee is for line charts in 3D. The data source
# can be array-based or object-based.
# 
# @author zero / zhaoyunhaosss@gmail.com

Vector3 = @Vizz.Core.Vector3
Scaler  = @Vizz.Core.Scaler
Segment = @Vizz.Primitive.Segment

class LineChart

  constructor: (@raw_data, @renderer) ->

  # Process data with specific configuration.
  process: (curve, range) ->
    # Get the points on the curve for rendering each piece of data
    # within the given range.
    stops = curve.stops(@raw_data.length)
    curve.scale(stops, range)

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
        new Vector3(pos_next.x, val_next, pos_next.z)
      )
      segment.dotted(2, 10, 0xffff00)
      @renderer.add(segment)

  # Histogram on curve.
  onCurve: (curve, range) ->
    @process(curve, range)
    @render()


@Vizz.Graphics.LineChart = LineChart
