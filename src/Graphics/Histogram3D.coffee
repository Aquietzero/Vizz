
# Histogram.coffee is for histograms in 3D. The data source
# can be array-based or object-based.
# 
# @author zero / zhaoyunhaosss@gmail.com

Range   = @Vizz.Core.Range
Rect    = @Vizz.Core.Rect
Surface = @Vizz.Core.Surface
Scaler  = @Vizz.Core.Scaler
Bar     = @Vizz.Primitive.Bar
Graph   = @Vizz.Graphics.Graph

class Histogram3D extends Graph

  CONFIG:
    surface: new Surface( ( -> 0), new Rect(new Range(-250, 250), new Range(-250, 250)))
    rect: new Rect(new Range(-250, 250), new Range(-250, 250))

  constructor: (@raw_data, @renderer, config) ->
    @setConfig(config, @CONFIG)
    super()

    @onSurface()

  # Process data with specific configuration.
  process: ->
    # Get the points on the curve for rendering each piece of data
    # within the given range.
    stops = @CONFIG.surface.stops(@raw_data.length, @raw_data[0].length)
    # @CONFIG.curve.scale(stops, @CONFIG.range)

    @render_data = []
    for i in [0...@raw_data.length]
      for j in [0...@raw_data[0].length]
        @render_data.push
          pos: stops[i*@raw_data[0].length + j]
          val: @raw_data[i][j]

  # Render the processed data.
  render: ->
    for i in [0...@render_data.length]
      bar = new Bar @render_data[i].val, @render_data[i].pos,
        radius: 20

      @graph_data.push bar
      @renderer.add bar

  # Histogram on curve.
  onSurface: ->
    @process()
    @render()


@Vizz.Graphics.Histogram3D = Histogram3D
