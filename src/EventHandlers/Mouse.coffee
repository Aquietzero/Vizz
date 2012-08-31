# MouseHandler defines the mouse event handler.
#
# @author zero / zhaoyunhaosss@gmail.com

class Mouse

  constructor: (renderer) ->
    # For mouse movement.
    @mouse  = new THREE.Vector2
    @offset = new THREE.Vector3
    
    # For moveable object.
    @SELECTED    = null
    @INTERSECTED = null

    # For ray intersection.
    @projector = new THREE.Projector
    @plane  = new THREE.Mesh(
      new THREE.PlaneGeometry(2000, 2000, 8, 8),
      new THREE.MeshBasicMaterial({color: 0x000000})
    )
    @plane.geometry.applyMatrix(new THREE.Matrix4().makeRotationX(Math.PI / 2))
    @plane.visible = false
    renderer.scene.add @plane

    @renderer = renderer.renderer
    @camera   = renderer.camera
    @controls = renderer.controls
    @objects  = renderer.objects

  onMouseMove: (event) =>
    event.preventDefault()

    @mouse.x = (event.clientX / window.innerWidth) * 2 - 1
    @mouse.y = - (event.clientY / window.innerHeight) * 2 + 1

    vector = new THREE.Vector3(@mouse.x, @mouse.y, 0.5)
    @projector.unprojectVector vector, @camera

    ray = new THREE.Ray(@camera.position, vector.subSelf(@camera.position).normalize())

    # Move the object if it has been already selected.
    if @SELECTED
      intersects = ray.intersectObject @plane
      @SELECTED.getGeometry().position.copy intersects[0].point.subSelf(@offset)
      return

    # If no object has been select, then use the ray trace method to find 
    # which object maybe selected.
    intersects = []
    for obj in @objects
      geom = obj.getGeometry()
      intersect = ray.intersectObject geom
      intersects.push obj if intersect.length > 0

    intersects.sort (a, b) ->
      a.getGeometry().distance - b.getGeometry().distance

    if intersects.length > 0
      if @INTERSECTED isnt intersects[0]
        
        # TODO Test event
        @INTERSECTED?.eventHandler.triggered('onLostFocus')

        # Focus on the first intersect object.
        @INTERSECTED = intersects[0]

        # TODO Test event
        @INTERSECTED?.eventHandler.triggered('onFocus')

        @plane.position.copy @INTERSECTED.getGeometry().position
        @plane.lookAt @camera.position

      @renderer.domElement.style.cursor = 'pointer'

    # If there aren't any intersect objects, then clear the previous one.
    else
      if @INTERSECTED
        # INTERSECTED.material.color.setHex(INTERSECTED.currentHex)
        @INTERSECTED = null
        @renderer.domElement.style.cursor = 'auto'

  onMouseDown: (event) =>
    event.preventDefault()

    vector = new THREE.Vector3(@mouse.x, @mouse.y, 0.5)
    @projector.unprojectVector vector, @camera

    ray = new THREE.Ray(@camera.position, vector.subSelf(@camera.position).normalize())

    intersects = []
    for obj in @objects
      geom = obj.getGeometry()
      intersect = ray.intersectObject geom
      intersects.push obj if intersect.length > 0
      
    if intersects.length > 0
      @controls.enabled = false

      @SELECTED = intersects[0]
      intersects = ray.intersectObject @plane
      @offset.copy(intersects[0].point).subSelf(@plane.position)

      @renderer.domElement.style.cursor = 'move'

  onMouseUp: (event) =>
    event.preventDefault()

    @controls.enabled = true
    if @INTERSECTED
      @plane.position.copy @INTERSECTED.getGeometry().position
      @SELECTED = null

    @renderer.domElement.style.cursor = 'auto'


@Vizz.EventHandler.Mouse = Mouse
