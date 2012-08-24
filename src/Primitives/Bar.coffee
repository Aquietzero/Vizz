
# Bar.js defines the bar, which is a slim cuboid.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Bar extends Geometry

  constructor: (@x_width, @height, @z_width, pos, color) ->
    geom = new THREE.CubeGeometry(x_width, height, z_width)
    mesh = new THREE.MeshLambertMaterial(color: color)

    @calCentroid pos
    super(geom, mesh, pos)

  # Set the centroid of the bar, which is in the middle of the height
  # of the bar by default. Since the position is set according to the
  # centroid, so there is necessary to be able to change it.
  calCentroid: (pos) ->
    pos.y += @height / 2


@Vizz.Primitive.Bar = Bar
