
# Histogram.coffee is for histograms in 3D. The data source
# can be array-based or object-based.
# 
# @author zero / zhaoyunhaosss@gmail.com

Range  = @Vizz.Core.Range
Curve  = @Vizz.Core.Curve
Scaler = @Vizz.Core.Scaler
Bar    = @Vizz.Primitive.Bar

class Histogram

  CONFIG:
    curve: new Curve( ( -> 0), 'CARTESIAN', new Range(-6, 6), 0.01 )
    range: new Range(-220, 220)

  constructor: (@raw_data, @renderer, config) ->
    @setConfig(config, @CONFIG)
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
    for i in [0...@render_data.length]
      @renderer.add new Bar(@render_data[i].val, @render_data[i].pos)

  # Histogram on curve.
  onCurve: () ->
    @process()
    @render()

  # Overwrites the default configuration with the given
  # user configuration.
  setConfig: (user_config, default_config) ->
    for key, val of user_config
      if default_config.hasOwnProperty(key)
        default_config[key] = user_config[key]


@Vizz.Graphics.Histogram = Histogram
