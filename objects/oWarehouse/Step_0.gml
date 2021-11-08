/// @description
if(control) control.step();

#region CONTROL CAMERA
var view_height = camera_get_view_height(view);
var height_room = room_height;

var mouse_input = mouse_wheel_down() - mouse_wheel_up();
cameraTargetY = cameraTargetY + mouse_input*30;
cameraTargetY = clamp(cameraTargetY,0,height_room-540)

var camera_y = camera_get_view_y(view);
var camera_x = camera_get_view_x(view);
camera_y += (cameraTargetY - camera_y) * 0.1;
camera_y = clamp(camera_y,0,height_room-540);
camera_set_view_pos(view,camera_x,camera_y);
#endregion
