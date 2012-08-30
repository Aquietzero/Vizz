
# Bar.js defines the bar, which is a slim cuboid.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Bar extends Geometry

  CONFIG:
    color   : 0x0000ff
    opacity : 0.5
    radius  : 5

  constructor: (@height, pos, config) ->
    @setConfig(config, @CONFIG)

    geom = new THREE.CubeGeometry(
      @CONFIG.radius,
      height,
      @CONFIG.radius
    )
    mesh = new THREE.MeshLambertMaterial(
      color       : @CONFIG.color
      opacity     : @CONFIG.opacity
      transparent : true
    )

    @calCentroid pos
    super(geom, mesh, pos)

  # Set the centroid of the bar, which is in the middle of the height
  # of the bar by default. Since the position is set according to the
  # centroid, so there is necessary to be able to change it.
  calCentroid: (pos) ->
    pos.y += @height / 2

  onFocus: ->
    @geometry.material.opacity = 1

  loseFocus: ->
    @geometry.material.opacity = @CONFIG.opacity


@Vizz.Primitive.Bar = Bar
