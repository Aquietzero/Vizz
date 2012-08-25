
# Sphere.js defines the point, or ball, which is a sphere.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Sphere extends Geometry

  constructor: (radius, pos, color) ->
    geom = new THREE.SphereGeometry(radius, 50, 50)
    mesh = new THREE.MeshLambertMaterial(color: color)

    super(geom, mesh, pos)


@Vizz.Primitive.Sphere = Sphere 
