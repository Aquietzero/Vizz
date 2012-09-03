# Plane.js defines the plane, which is actually rendered as a solid
# cube in THREE.js with height 1.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Plane extends Geometry

  CONFIG:
    color   : 0x0000ff
    opacity : 0.8

  constructor: (@size, pos, config) ->

    @setConfig(config, @CONFIG)

    geom = new THREE.CubeGeometry(@size, 1, @size)
    mesh = new THREE.MeshLambertMaterial(
      color      : @CONFIG.color
      opacity    : @CONFIG.opacity
      trasparent : true
    )

    super(geom, mesh, pos)

@Vizz.Primitive.Plane = Plane
