# This is the rendering framework of the whole project.
#
# @author zero / zhaoyunhaosss@gmail.com

# For mouse movement.
mouse  = new THREE.Vector2()
offset = new THREE.Vector3()

# For moveable object.
SELECTED    = null
INTERSECTED = null


# For ray intersection.
projector = new THREE.Projector()
plane  = new THREE.Mesh(
  new THREE.PlaneGeometry(2000, 2000, 8, 8),
  new THREE.MeshBasicMaterial({color: 0x000000})
)
plane.geometry.applyMatrix(new THREE.Matrix4().makeRotationX(Math.PI / 2))
plane.visible = false

class Renderer

  constructor: (@container) ->
    @width  = window.innerWidth
    @height = window.innerHeight

    @initThree()
    @initScene()
    @initCamera()
    @initLight()
    @initControls()

    @initMouseEvents()

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


  # Initialize mouse events. Including mouse down, mouse up and
  # mouse move.
  initMouseEvents: ->
    @scene.add(@plane)

    # Add event handler.
    @renderer.domElement.addEventListener('mousemove', @onMouseMove, false)
    @renderer.domElement.addEventListener('mousedown', @onMouseDown, false)
    @renderer.domElement.addEventListener('mouseup',   @onMouseUp, false)

  onMouseMove: (event) =>
    event.preventDefault()

    mouse.x = (event.clientX / window.innerWidth) * 2 - 1
    mouse.y = - (event.clientY / window.innerHeight) * 2 + 1

    vector = new THREE.Vector3(mouse.x, mouse.y, 0.5)
    projector.unprojectVector(vector, @camera)

    ray = new THREE.Ray(@camera.position, vector.subSelf(@camera.position).normalize())

    if SELECTED
      intersects = ray.intersectObject(plane)
      SELECTED.position.copy(intersects[0].point.subSelf(offset))
      return

    objects = (obj.getGeometry() for obj in @objects)
    intersects = ray.intersectObjects(objects)
    if intersects.length > 0
      if INTERSECTED isnt intersects[0].object
        # if INTERSECTED
        #   INTERSECTED.material.color.setHex(INTERSECTED.currentHex)

        INTERSECTED = intersects[0].object
        # INTERSECTED.currentHex = INTERSECTED.material.color.getHex()

        plane.position.copy(INTERSECTED.position)
        plane.lookAt(@camera.position)

      @renderer.domElement.style.cursor = 'pointer'

    else
      if INTERSECTED
        # INTERSECTED.material.color.setHex(INTERSECTED.currentHex)
        INTERSECTED = null
        @renderer.domElement.style.cursor = 'auto'

  onMouseDown: (event) =>
    event.preventDefault()

    vector = new THREE.Vector3(mouse.x, mouse.y, 0.5)
    projector.unprojectVector(vector, @camera)

    ray = new THREE.Ray(@camera.position, vector.subSelf(@camera.position).normalize())

    objects = (obj.getGeometry() for obj in @objects)
    intersects = ray.intersectObjects(objects)
    if intersects.length > 0
      @controls.enabled = false

      SELECTED = intersects[0].object
      intersects = ray.intersectObject(plane)
      offset.copy(intersects[0].point).subSelf(plane.position)

      @renderer.domElement.style.cursor = 'move'

  onMouseUp: (event) =>
    event.preventDefault()

    @controls.enabled = true
    if INTERSECTED
      plane.position.copy(INTERSECTED.position)
      SELECTED = null

    @renderer.domElement.style.cursor = 'auto'


@Vizz.Renderer = Renderer
