
# Primitive segment is not rendered as a line. Instead, a
# dotted "cylinder" or a solid "cylinda" are optional.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Segment extends Geometry

  CONFIG:
    color   : 0xffff00
    opacity : 0.8
    radius  : 2
    offset  : 10

  constructor: (begin, end, config) ->
    @setConfig config, @CONFIG

    @p = begin
    @dir = end.sub begin
    @len = @dir.magnitude()
    @pos = @p.add @dir.mul 0.5
   
  # A dotted segment.
  dotted: ->
    @geometry = new THREE.Object3D

    step = @len / @CONFIG.offset
    # Add dots.
    for i in [0...step]
      pos = @p.add @dir.mul(i * @CONFIG.offset / @len)
      p = new THREE.Mesh(
        new THREE.SphereGeometry(@CONFIG.radius, 30, 30),
        new THREE.MeshLambertMaterial
          color   : @CONFIG.color
          opacity : @CONFIG.opacity
      )
      p.position.set(pos.x, pos.y, pos.z)
      @geometry.add p

  # A solid segment.
  solid: ->
    @geometry = new THREE.Mesh(
      new THREE.CylinderGeometry @CONFIG.radius, @CONFIG.radius, @len, 50, 50, true
      new THREE.MeshLambertMaterial
        color   : @CONFIG.color
        opacity : @CONFIG.opacity
    )

    @setOrientation(@dir)
    @setPosition(@pos)

   
@Vizz.Primitive.Segment = Segment
