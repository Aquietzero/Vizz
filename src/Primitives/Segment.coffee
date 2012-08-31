
# Primitive segment is not rendered as a line. Instead, a
# dotted "cylinder" or a solid "cylinda" are optional.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Segment extends Geometry

  constructor: (begin, end) ->
    @p = begin
    @dir = end.sub begin
    @len = @dir.magnitude()
    @pos = @p.add @dir.mul(0.5)
   
  # A dotted segment.
  dotted: (radius, offset, color) ->
    @geometry = new THREE.Object3D

    step = @len / offset
    # Add dots.
    for i in [0...step]
      pos = @p.add(@dir.mul(i * offset / @len))
      p = new THREE.Mesh(
        new THREE.SphereGeometry(radius, 30, 30),
        new THREE.MeshLambertMaterial(color: color)
      )
      p.position.set(pos.x, pos.y, pos.z)
      @geometry.add p

  # A solid segment.
  solid: (radius, color) ->
    @geometry = new THREE.Mesh(
      new THREE.CylinderGeometry(radius, radius, @len, 50, 50, true)
      new THREE.MeshLambertMaterial(color: color)
    )

    @setOrientation(@dir)
    @setPosition(@pos)

   
@Vizz.Primitive.Segment = Segment
