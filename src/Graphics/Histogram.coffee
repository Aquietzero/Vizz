
# Histogram.coffee is for histograms in 3D. The data source
# can be array-based or object-based.
# 
# @author zero / zhaoyunhaosss@gmail.com

class Histogram

  constructor: (@data, @renderer) ->

  # Process data with specific configuration.
  process: (line, range) ->
    # Get the points on the line for rendering each piece of data
    # within the given range.
    stops = line.stops(@data.length)
    Scaler.positions(stops, line.range, range)

    @render_data = (pos: stops[i], val: @data[i] for i in [0...@data.length])

  # Render the processed data.
  render: ->
    for i in [0...@render_data.length]
      pos = @render_data[i].pos
      val = @render_data[i].val
      bar = new Bar(5, val, 5, {x:pos.x, y:0, z:pos.z}, 0x0000ff);
      @renderer.add(bar)

  # Histogram on line.
  onLine: (line, range) ->
    @process(line, range)
    @render()


@Histogram = Histogram
