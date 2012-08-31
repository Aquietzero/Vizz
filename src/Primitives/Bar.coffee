
# Bar.js defines the bar, which is a slim cuboid.
#
# @author zero / zhaoyunhaosss@gmail.com

Geometry = @Vizz.Primitive.Geometry

class Bar extends Geometry

  CONFIG:
    color   : 0x0000ff
    opacity : 0.7
    radius  : 5

  constructor: (@height, pos, config) ->
    @setConfig config, @CONFIG

    geom = new THREE.CubeGeometry(
      @CONFIG.radius,
      height,
      @CONFIG.radius
    )

    mesh = new THREE.MeshLambertMaterial
      color       : @CONFIG.color
      opacity     : @CONFIG.opacity
      transparent : true

    @calCentroid pos
    super geom, mesh, pos

  # Set the centroid of the bar, which is in the middle of the height
  # of the bar by default. Since the position is set according to the
  # centroid, so there is necessary to be able to change it.
  calCentroid: (pos) ->
    pos.y += @height / 2

  onFocus: ->
    @geometry.material.opacity = 1
    @geometry.material.color.setHex 0x550055

  onLostFocus: ->
    @geometry.material.opacity = @CONFIG.opacity
    @geometry.material.color.setHex @CONFIG.color
    

@Vizz.Primitive.Bar = Bar
