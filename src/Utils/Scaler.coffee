
# Scaler.coffee is used to adjust the function coordinate to
# the world coordinate.
#
# @author zero / zhaoyunhaosss@gmail.com

Scaler =

  positions: (positions, range_function, range_world) ->
    rate_x = range_world.begin / range_function.begin
    rate_z = range_world.end / range_function.end

    for p in positions
      p.x *= rate_x
      p.z *= rate_z


@Scaler = Scaler
