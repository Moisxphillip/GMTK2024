extends Node3D

var applicationReference = null

@onready var display = $Display
@onready var subViewport = $SubViewport
@onready var clickableArea = $ClickableArea

var meshSize = Vector2()

var mouse_entered = false
var mouse_held = false
var mouse_inside = false

var last_mouse_pos_3d = null
var last_mouse_pos_2d = null

func _ready():
    clickableArea.mouse_entered.connect(func(): mouse_entered = true)
    subViewport.set_process_input(true)

func _unhandled_input(event):
    var is_mouse_event = false
    if event is InputEventMouseMotion or event is InputEventMouseButton:
        is_mouse_event = true
    
    if mouse_entered and (is_mouse_event or mouse_held):
        handle_mouse(event)
    elif not is_mouse_event:
        subViewport.push_input(event, true)

func handle_mouse(event):
    meshSize = display.mesh.size	
    
    if event is InputEventMouseButton or event is InputEventScreenTouch:
        mouse_held = event.pressed
    
    var mouse_pos3d = find_mouse(event.global_position)
    mouse_inside = mouse_pos3d != null
    
    if mouse_inside:
        mouse_pos3d = clickableArea.global_transform.affine_inverse() * mouse_pos3d
        last_mouse_pos_3d = mouse_pos3d
    else:
        mouse_pos3d = last_mouse_pos_3d
        if mouse_pos3d == null:
            mouse_pos3d = Vector3.ZERO
    var mouse_pos2D = Vector2(mouse_pos3d.x, -mouse_pos3d.y)
    #convert from -meshsize/2 to meshsize/2
    mouse_pos2D.x += meshSize.x/2
    mouse_pos2D.y += meshSize.y/2
    #convert to 0 to 1
    mouse_pos2D.x = mouse_pos2D.x / meshSize.x
    mouse_pos2D.y = mouse_pos2D.y / meshSize.y
    #convert vo viewport range 0 to viewport size
    mouse_pos2D.x = mouse_pos2D.x * subViewport.size.x
    mouse_pos2D.y = mouse_pos2D.y * subViewport.size.y
    
    
    
    event.position = mouse_pos2D
    event.global_position = mouse_pos2D
    
    if event is InputEventMouseMotion:
        if last_mouse_pos_2d == null:
            event.relative = Vector2(0,0)
        else:
            event.relative = mouse_pos2D - last_mouse_pos_2d
        
    last_mouse_pos_2d = mouse_pos2D
    subViewport.push_input(event)
    
func find_mouse(pos:Vector2):
    var camera = get_viewport().get_camera_3d()
    
    var dss: PhysicsDirectSpaceState3D =  get_world_3d().direct_space_state
    
    var rayparam = PhysicsRayQueryParameters3D.new()
    rayparam.exclude = [$ClickableArea, $ClickableArea/CollisionShape3D]
    rayparam.from = camera.project_ray_origin(pos)
    
    var dis = 5
    rayparam.to = rayparam.from + camera.project_ray_normal(pos) * dis
    rayparam.collide_with_areas = true
    rayparam.collide_with_bodies = false
    
    var result = dss.intersect_ray(rayparam)
    if result.size() > 0:
        return result.position
    else:
        return null
        





