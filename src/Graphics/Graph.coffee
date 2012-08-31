# Graph is a collection of reqresentatives of pieces of data.
#
# @author zero / zhaoyunhaosss@gmail.com

PrimitiveCollection = @Vizz.Primitive.PrimitiveCollection

class Graph

  constructor: ->
    @graph_data = []
    @events = null

  # Process data with specific configuration.
  process: ->

  # Render the processed data.
  render: ->

  # Histogram on curve.
  onCurve: ->
    @process()
    @render()

  # Overwrites the default configuration with the given
  # user configuration.
  setConfig: (user_config, default_config) ->
    for key, val of user_config
      if default_config.hasOwnProperty key
        default_config[key] = user_config[key]

  # event: 'onFocus'
  # effect: attr: value
  on: (event, effects) ->
    for obj in @graph_data
      obj[event] = ((obj, effects) ->
        return ->
          for attr, val of effects
            obj['set' + attr]? val
      )(obj, effects)

    @


@Vizz.Graphics.Graph = Graph
