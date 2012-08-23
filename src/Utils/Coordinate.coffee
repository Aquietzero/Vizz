
# Coordinate.coffee defines the methods to convert different
# coordinate systems into des cartesian coordinate system.
#
# @author zero / zhaoyunhaosss@gmail.com

Coordinate =

  cartesian: (x, z) ->
    return x:x, z:z

  polar: (theta, r) ->
    return x:r*Math.cos(theta), z:r*Math.sin(theta)

  getCoordinate: (type) ->
    switch type
      when 'CARTESIAN' then @cartesian
      when 'POLAR'     then @polar
      else @cartesian


@Coordinate = Coordinate
