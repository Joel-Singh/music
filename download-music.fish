#!/usr/bin/env fish

jj show && jj describe -m '$(date)' && jj git fetch && jj rebase -r @ -d main && jj bookmark set -r @ main && jj git push

set line_count $(cat music.txt | wc --lines)
set progress 0

mkdir -p downloaded-music

cat music.txt | while read -d " " --local directory link
	mkdir -p "downloaded-music/$directory"
	yt-dlp --abort-on-error --preset-alias mp3 --cookies-from-browser chrome --download-archive yt-dlp.archive --paths "downloaded-music/$directory" $link
	set progress $(math $progress+1)
	echo "Progress: $progress / $line_count"
end
