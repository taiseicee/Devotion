extends StaticBody2D

func _on_area_2d_body_entered(body):
	body.hit_by_object(self)
