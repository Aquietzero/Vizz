
# Geometries.js defines some basic geometries, or graphic primitives.
# @author zero / zhaoyunhaosss@gmail.com

# Geometry is the basic class of all graphic primitives.
class Geometry

  constructor: (geom, mesh, pos) ->
    @geometry = new THREE.Mesh(geom, mesh)
    @setPosition pos

  # Get geometry.
  getGeometry: ->
    @geometry

  # Set position of the geometry.
  setPosition: (pos) ->
    @geometry.position.set(pos.x, pos.y, pos.z)


@Vizz.Primitive.Geometry = Geometry
