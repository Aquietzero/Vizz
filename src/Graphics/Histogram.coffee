
# Histogram.coffee is for histograms in 3D. The data source
# can be array-based or object-based.
# 
# @author zero / zhaoyunhaosss@gmail.com

Scaler = @Vizz.Core.Scaler
Bar    = @Vizz.Primitive.Bar

class Histogram

  constructor: (@raw_data, @renderer) ->

  # Process data with specific configuration.
  process: (curve, range) ->
    # Get the points on the curve for rendering each piece of data
    # within the given range.
    stops = curve.stops(@raw_data.length)
    Scaler.positions(stops, curve.range, range)

    @render_data = (pos: stops[i], val: @raw_data[i] for i in [0...@raw_data.length])

  # Render the processed data.
  render: ->
    for i in [0...@render_data.length]
      pos = @render_data[i].pos
      val = @render_data[i].val
      bar = new Bar(5, val, 5, {x:pos.x, y:0, z:pos.z}, 0x0000ff);
      @renderer.add(bar)

  # Histogram on curve.
  onCurve: (curve, range) ->
    @process(curve, range)
    @render()


@Vizz.Graphics.Histogram = Histogram
