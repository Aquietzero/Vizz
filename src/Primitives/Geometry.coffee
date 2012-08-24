
# Geometries.js defines some basic geometries, or graphic primitives.
# @author zero / zhaoyunhaosss@gmail.com

# Geometry is the basic class of all graphic primitives.

Vector3 = @Vizz.Core.Vector3
Matrix3 = @Vizz.Core.Matrix3

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

  setOrientation: (dir) ->
    origin = new Vector3(0, 1, 0)
    target = dir.normalize()

    axis = origin.crossProduct(target).normalize()
    angle = Math.acos(origin.dotProduct(target))

    rotation = new Matrix3()
    rotation.setFromAxisAngle(axis, angle)

    m = new THREE.Matrix4()
    es = rotation.elements
    m.set(
      es[0], es[1], es[2], 0,
      es[3], es[4], es[5], 0,
      es[6], es[7], es[8], 0,
          0,     0,     0, 1
    )

    @geometry.applyMatrix(m)


@Vizz.Primitive.Geometry = Geometry
