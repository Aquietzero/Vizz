
# Curve.coffee defines the general curve in 2D. For example:
#
#   ^       
#   |    func      . . . . .
#   |      `-->  .           .
#   |          .              .          . .
#   |        .                 .       .    .
# --|---------------------------.-----.-------->
#   |                            . . .
#   |        
#   |        |<------------ range ---------->|
#   |
#
# @author zero / zhaoyunhaosss@gmail.com

class Curve

  constructor: (@func, @range, @accuracy) ->

  # Calculates the length of the curve in the specific range.
  length: () ->
    len = 0
    x   = @range.begin
    while x < @range.end
      len += Auxiliary.dist2(0, @func(x), @accuracy, @func(x+@accuracy))
      x += @accuracy

    return len


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
        stops.push(x:x, z:@func(x))
        counter++

      len += Auxiliary.dist2(0, @func(x), @accuracy, @func(x+@accuracy))
      x += @accuracy

    return stops


@Curve = Curve
