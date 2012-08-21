
# Geometries.js defines some basic geometries, or graphic primitives.
# @author zero / zhaoyunhaosss@gmail.com

# Geometry is the basic class of all graphic primitives.
class Geometry

  constructor: (geom, mesh, pos) ->

    @geometry = new THREE.Mesh(geom, mesh)
    @geometry.position.set(pos.x, pos.y, pos.z)


  # Get geometry.
  getGeometry: ->

    return @geometry


  # Set position of the geometry.
  setPosition: (pos) ->

    @geometry.position.set(pos)


# Bar is a slim cuboid.
class Bar extends Geometry

  constructor: (x_width, height, z_width, pos, color) ->

    geom = new THREE.CubeGeometry(x_width, height, z_width)
    mesh = new THREE.MeshLambertMaterial(color: color)

    super(geom, mesh, pos)


@Bar = Bar
