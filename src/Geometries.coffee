
# Geometries.js defines some basic geometries, or graphic primitives.
# @author zero / zhaoyunhaosss@gmail.com

# Geometry is the basic class of all graphic primitives.
class Geometry

  constructor: (geom, mesh, pos) ->
    @geometry = new THREE.Mesh(geom, mesh)
    @setPosition pos

  # Get geometry.
  getGeometry: ->
    return @geometry

  # Set position of the geometry.
  setPosition: (pos) ->
    @geometry.position.set(pos.x, pos.y, pos.z)


# Bar is a slim cuboid.
class Bar extends Geometry

  constructor: (@x_width, @height, @z_width, pos, color) ->
    geom = new THREE.CubeGeometry(x_width, height, z_width)
    mesh = new THREE.MeshLambertMaterial(color: color)

    @centroid = @calCentroid pos
    super(geom, mesh, @centroid)

  # Set the centroid of the bar, which is in the middle of the height
  # of the bar by default. Since the position is set according to the
  # centroid, so there is necessary to be able to change it.
  calCentroid: (pos) ->
    pos.y += @height / 2
    return pos


@Bar = Bar
