
# Auxiliary.coffee defines some useful functions for Vizz
#
# @author zero / zhaoyunhaosss@gmail.com

Auxiliary =

  dist: (x, y) ->
    return Math.sqrt(x*x + y*y)

  dist2: (x1, y1, x2, y2) ->
    return Math.sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1))


@Auxiliary = Auxiliary
