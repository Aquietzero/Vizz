
# Sphere.js defines the point, or ball, which is a sphere.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Sphere extends Geometry

  CONFIG:
    size    : 5
    color   : 0xffff00
    opacity : 0.8

  constructor: (pos, config) ->
    @setConfig config, @CONFIG

    geom = new THREE.SphereGeometry(@CONFIG.size, 20, 20)
    mesh = new THREE.MeshLambertMaterial
      color   : @CONFIG.color
      opacity : @CONFIG.opacity

    super(geom, mesh, pos)


@Vizz.Primitive.Sphere = Sphere
