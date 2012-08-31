# Surface defines a general surface in 3D.
#
# In three dimension, the function of the surface is given
# in the following way:
#
#   z = f(x, y)
#
# @author zero / zhaoyunhaosss@gmail.com

Range      = Vizz.Core.Range
Scaler     = Vizz.Core.Scaler
Distance   = Vizz.Core.Distance
Coordinate = Vizz.Core.Coordinate

class Surface

  constructor: (@func, @rect) ->
    # @scaler     = Scaler.getScaler(@type)
    # @distance   = Distance.getDistance(@type)
    # @coordinate = Coordinate.getCoordinate(@type)

  # Calculate all the stop points according to the number of data
  # and the curve itself.
  stops: (m, n) ->
    x       = @rect.x.begin
    z       = @rect.z.begin
    step_x  = @rect.x.length() / m
    step_z  = @rect.z.length() / n
    stops   = []

    for i in [0...m]
      for j in [0...n]
        curr_x = x+step_x*i
        curr_z = z+step_z*j
        stops.push
          x:curr_x
          y:@func(curr_x, curr_z)
          z:curr_z

    stops


@Vizz.Core.Surface = Surface
