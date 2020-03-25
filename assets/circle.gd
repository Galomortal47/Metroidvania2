extends Line2D

var point_count= 16
var point_render= 17
var radius = 4
var spiral = 0
var x = 0
var y = 0

func _physics_process(delta):
    draw_circle_line2D(point_count,point_render,radius,x,y,spiral)

func draw_circle_line2D(point_count,point_render,radius,x,y,spiral):
    var circle = PoolVector2Array()
    for i in range(point_render):
        var angle = PI * i / (point_count-1) * 2
        radius = radius - spiral
        circle.append(Vector2((radius * cos(angle) + x),(radius * sin(angle) + y)))
    set_points(circle)