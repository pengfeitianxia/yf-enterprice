$.fn.scrollItem = function(obj) {
	var ticker = $(this);
	ticker.css("overflow", "hidden");
	var option = {
		duration:2500,
		marginTopSide:0//标签外区域可定
	}
	var opts = $.extend({}, option, obj);
	function animator(currentItem) {
		var distance = currentItem.outerHeight()+opts.marginTopSide;
		currentItem.animate({
			marginTop: -distance
		}, opts.duration, "linear", function() {
			currentItem.appendTo(currentItem.parent()).css("marginTop", 0);
			animator(currentItem.parent().children(":first"));
		});
	};
	animator(ticker.children(":first"));
	ticker.mouseenter(function() {
		ticker.children().stop();
	});
	ticker.mouseleave(function() {
		animator(ticker.children(":first"));
	});
}