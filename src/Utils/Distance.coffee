
# Distance.coffee defines some ways to calculate the distance
# between two points.
#
# @author zero / zhaoyunhaosss@gmail.com

Distance =

  segment: (x, y) ->
    return Math.sqrt(x*x + y*y)

  cartesian: (x1, y1, x2, y2) ->
    return Math.sqrt((x2-x1)*(x2-x1) + (y2-y1)*(y2-y1))

  # Since the delta theta is really small, so the cosine theorm can
  # be applied to estimate the length of the arc between (r1, theta1)
  # and (r2, theta2).
  polar: (theta1, r1, theta2, r2) ->
    return Math.sqrt(r1*r1 + r2*r2 - 2*r1*r2*Math.cos(theta2-theta1))

  getDistance: (type) ->
    switch type
      when 'CARTESIAN' then @cartesian
      when 'POLAR'     then @polar
      else @cartesian


@Distance = Distance
