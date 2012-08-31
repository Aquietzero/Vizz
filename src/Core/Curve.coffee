
# Curve.coffee defines the general curve in 2D. For example:
#
#   ^                . . . .
#   |    func      .        .
#   |      `-->  .           .
#   |          .              .          . .
#   |                          .       .    .
# --|---------------------------.-----.-------->
#   |                            .   .
#   |                             . .
#   |                              
#   |          |<---------- range ---------->|
#   |
#
# @author zero / zhaoyunhaosss@gmail.com

Range      = Vizz.Core.Range
Scaler     = Vizz.Core.Scaler
Distance   = Vizz.Core.Distance
Coordinate = Vizz.Core.Coordinate

class Curve

  constructor: (@func, @type, @range, @accuracy) ->
    @scaler     = Scaler.getScaler(@type)
    @distance   = Distance.getDistance(@type)
    @coordinate = Coordinate.getCoordinate(@type)

  scale: (positions, world_range) ->
    @scaler(positions, @range, world_range)

  # Calculates the length of the curve in the specific range.
  length: () ->
    len = 0
    x   = @range.begin
    while x < @range.end
      len += @distance(0, @func(x), @accuracy, @func(x+@accuracy))
      x += @accuracy

    len

  # Calculate all the stop points according to the number of data
  # and the curve itself.
  stops: (n) ->
    len     = 0
    counter = 0
    x       = @range.begin
    step    = @length() / n
    stops   = []

    while counter < n
      if len >= step
        len = 0
        stops.push(@coordinate(x, @func(x)))
        counter++

      len += @distance(0, @func(x), @accuracy, @func(x+@accuracy))
      x += @accuracy

    stops

  # Calculate the bounding rectangle of the curve.
  boundingRect: ->
    z_max = -Infinity
    z_min = Infinity

    x = @range.begin
    while x < @range.end
      y = @func(x)
      z_max = y if y > z_max
      z_min = y if y < z_min
      x += @accuracy

    x: @range
    z: new Range(z_min, z_max)

@Vizz.Core.Curve = Curve
