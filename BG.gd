extends ParallaxBackground

# Scrolling speed in pixels per second
var scrolling_speed = 100

func _process(delta):
	# Update the scroll offset based on the speed and the elapsed time (delta)
	scroll_offset.x -= scrolling_speed * delta
	
	# Ensure the offset stays within a reasonable range to avoid precision issues
	# This is optional but can help prevent floating-point precision issues over long periods
	if scroll_offset.x < -get_child(0).get_child(0).texture.get_size().x:
		scroll_offset.x = 0
