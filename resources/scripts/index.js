const YOUTUBE_LINK = 'youtube_link';

function changePage(path) {
	window.location.href = path;
}

function handleClicks(evt) {
	if (evt.target.classList.contains('link')) {
		if (evt.target.classList.contains('project1')) {
			if (evt.target.classList.contains('main')) {
				changePage('project1.html');
			} 
			else {
				switch (evt.target.id) {
					case YOUTUBE_LINK:
						changePage('project1-videos.html');
						break;
					case 'picture_link':
						changePage('project1-layouts_and_controls.html');
						break;
					default:
				}
			}
		} 
		else if (evt.target.classList.contains('project2')) {
			if (evt.target.classList.contains('main')) {
				changePage('project2.html');
			}
			else {
				switch (evt.target.id) {
					case YOUTUBE_LINK:
						changePage('project2-videos.html');
				}
			}
		}
		else {
			switch (evt.target.id) {
				case 'index':
					changePage('index.html');
					break;
				case 'project1-header':
					changePage('project1.html');
					break;
				case 'project2-header':
					changePage('project2.html');
					break;
				default:
			}
		}
	}
}

document.addEventListener("DOMContentLoaded", function() {
	document.addEventListener("click", function(evt) {
		handleClicks(evt)
	});
})