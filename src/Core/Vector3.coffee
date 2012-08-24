# Vector in space
#
# @author zero / zhaoyunhaosss@gmail.com

class Vector3

  constructor: (@x, @y, @z) ->

  set: (x, y, z) ->
    @x = x
    @y = y
    @z = z

  copy: (v) ->
    @x = v.x
    @y = v.y
    @z = v.z
    @

  inverse: ->
    new Vector3(-@x, -@y, -@z)

  inverseSelf: ->
    @x = -@x
    @y = -@y
    @z = -@z
  
  add: (v) ->
    new Vector3(@x + v.x, @y + v.y, @z + v.z)

  addVector: (v) ->
    @x += v.x
    @y += v.y
    @z += v.z

  addScaledVector: (v, s) ->
    @x += v.x * s
    @y += v.y * s
    @z += v.z * s
 
  sub: (v) ->
    new Vector3(@x - v.x, @y - v.y, @z - v.z)

  subVector: (v) ->
    @x -= v.x
    @y -= v.y
    @z -= v.z
  
  mul: (s) ->
    new Vector3(@x * s, @y * s, @z * s)

  mulScalar: (s) ->
    @x *= s
    @y *= s
    @z *= s

  div: (s) ->
    return new Vector3(@x/s, @y/s, @z/s) unless s is 0

  divScalar: (s) ->
    unless s is 0
      @x /= s
      @y /= s
      @z /= s

  dotProduct: (v) ->
    @x*v.x + @y*v.y + @z*v.z

  # 6 multiplications and 3 additions.
  crossProduct: (v) ->
    new Vector3(
      @y*v.z - @z*v.y,
      @z*v.x - @x*v.z,
      @x*v.y - @y*v.x
    )

  # Projects the current vector onto the given vector with the
  # following formula:
  #
  #              v * u
  #   proj(v) = -------
  #               |u|
  #
  projectOnVector: (v) ->
    @dotProduct(v) / v.magnitude()

  # Projects the current vector onto the given direction with the
  # following formula:
  #
  #               v * dir
  #   proj(v) = --------- = v * dir
  #                 |dir|
  #
  projectOnUnit: (n) ->
    @dotProduct(n)

  magnitudeSquare: ->
    @x*@x + @y*@y + @z*@z

  magnitude: ->
    Math.sqrt(@magnitudeSquare())

  normalize: ->
    magnitude = @magnitude()

    return @div(magnitude) if magnitude > 0
    return new Vector3(0, 0, 0)

  normalizeSelf: ->
    magnitude = @magnitude()

    @divScalar(magnitude) if magnitude > 0

  getAngleX: ->
    Math.acos(@x / @magnitude())

  getAngleY: ->
    Math.acos(@y / @magnitude())

  getAngleZ: ->
    Math.acos(@z / @magnitude())

  getDirectionalCosine: ->
    magnitude = @magnitude()

    x: @x / magnitude
    y: @y / magnitude
    z: @z / magnitude

  log: ->
    console.log(@x, @y, @z)


@Vizz.Core.Vector3 = Vector3
