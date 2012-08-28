# This is the rendering framework of the whole project.
#
# @author zero / zhaoyunhaosss@gmail.com

class Renderer

  constructor: (@container) ->

    @width  = window.innerWidth
    @height = window.innerHeight

    @initThree()
    @initScene()
    @initCamera()
    @initLight()
    @initControls()

    @objects = []


  # Initialize WebGL renderer.
  initThree: ->

    @renderer = new THREE.WebGLRenderer(antialias: true)
    @renderer.setSize(@width, @height)

    document.getElementById(@container).appendChild(@renderer.domElement)
    @renderer.setClearColorHex(0x000000, 1.0)

    @renderer.shadowMapEnabled = true
    @renderer.shadowMapSoft    = true


  # Initialize scene.
  initScene: ->

    @scene = new THREE.Scene()


  # Initialize camera.
  initCamera: ->

    @camera = new THREE.PerspectiveCamera(45, @width / @height, 0.01, 1e10)

    @camera.position.set(500, 800, 500)
    @camera.up.set(0, 1, 0)
    @camera.lookAt(x:0, y:150, z:0)

    @scene.add(@camera)


  # Initialize light.
  initLight: ->

    directionalLight = new THREE.DirectionalLight(0xffffff, 1.0)
    directionalLight.position.set(50, 100, 200)

    directionalLight.castShadow = true
    directionalLight.shadowBias = -0.00022
    directionalLight.shadowDarkness = 0.5

    directionalLight.shadowMapWidth  = 1024
    directionalLight.shadowMapHeight = 1024

    ambientLight = new THREE.AmbientLight(0x111111, 0.1)

    @scene.add(directionalLight)
    @scene.add(ambientLight)


  # Initialize controls
  initControls: ->

    @controls = new THREE.TrackballControls(@camera)

    @controls.rotateSpeed = 1.0
    @controls.zoomSpeed   = 1.3
    @controls.panSpeed    = 0.8

    @controls.keys = [ 65, 83, 68 ]


  # Add objects to the scene
  add: (obj) ->

    @objects.push(obj)
    @scene.add(obj.getGeometry())


  # Render
  render: ->

    @controls.update()
    @renderer.clear()
    @renderer.render(@scene, @camera)

 
@Vizz.Renderer = Renderer
