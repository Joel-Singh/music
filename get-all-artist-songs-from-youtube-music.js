/* This script pulls all artists songs from youtube music on the
 * page you get to when you click "more", which lists all their
 * songs. It's intended to be run from the developer console */

let songs_container = document.querySelector("#items.style-scope.ytmusic-grid-renderer");
let song_anchors = Array.from(songs_container.querySelectorAll("a.yt-formatted-string"));

function get_text(anchor) {
	return console.log(anchor);
}

let song_names_and_link_str = "";
for (let anchor of song_anchors) {
	song_names_and_link_str += anchor.text + " " + anchor.href + "\n";
}

