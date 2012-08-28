
# Coordinate.coffee defines the methods to convert different
# coordinate systems into des cartesian coordinate system.
#
# @author zero / zhaoyunhaosss@gmail.com

@Vizz.Core.Coordinate =

  cartesian: (x, z) ->
    x:x, y:0, z:z

  polar: (theta, r) ->
    x:r*Math.cos(theta), y:0, z:r*Math.sin(theta)

  getCoordinate: (type) ->
    switch type
      when 'CARTESIAN' then @cartesian
      when 'POLAR'     then @polar
      else @cartesian
