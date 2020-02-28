* 8:00 Research Spot API
* 9:00 trying to understand Spotify URI to log into my account.  My account was created with Facebook login.  So how do I use that in an API?
* spotify console https://developer.spotify.com/dashboard/applications/0d33cf4dd1554d0ca36a41cca75f7454
* 9:30 initial rails file, naming problem, need to start over
* 10:00 rusty start on rails, keep messing up naming conventions and having to teardown and restart.
* postman instructions https://documenter.getpostman.com/view/583/spotify-playlist-generator/2MtDWP?version=latest
* 10:30 started setup of files and diverted to prioritize making api connect in postman before anything else.
* 11:30 SUCCESSFUL postman connection to MY OWN playlists of my profile including playlists authored and shared from others.  YAYYYYYYYY!
12:00 to 1 - lunch
* 1:00 to 1:30 try to get a feel for the structure of the json object return.
OAuth 2.0 gem https://github.com/icoretech/omniauth-spotify
json object structure - https://developer.spotify.com/documentation/web-api/reference/object-model/#playlist-track-object
* rspotify gem https://rdoc.info/github/guilhermesad/rspotify/master/frames
* DO NOT FORGET that you have to update spotify console settings to update Redirect URIs.


* Initial json objects to save to DB

*Playlist object*
* href - link to playlist
* id - spotify playlist id
* name - name of playlists
* tracks - array of playlist track objects


*Saved Track Object*
* added_at - timestamp for added track

*Track Object*
* album
* artist
* disc_number
* duration_ms - length
* href - API endpoint on track
* id - track spotify id
* preview_url - 30 second preview
* track_number
* uri - Spotify URI
* is_local

*Need to verify new columns to add to record*
* genre
* Star Ratings
* Comments
* Smart Playlist tags, several




genres is in the Artist and Album objects


METHOD	ENDPOINT	USAGE	RETURNS
POST	/v1/playlists/{playlist_id}/tracks	Add Tracks to a Playlist	-
PUT	/v1/playlists/{playlist_id}	Change a Playlist's Details	-
POST	/v1/users/{user_id}/playlists	Create a Playlist	-
GET	/v1/me/playlists	Get a List of Current User's Playlists	playlists
GET	/v1/users/{user_id}/playlists	Get a List of a User's Playlists	playlists
GET	/v1/playlists/{playlist_id}/images	Get a Playlist Cover Image	list of image objects
GET	/v1/playlists/{playlist_id}	Get a Playlist	playlist
GET	/v1/playlists/{playlist_id}/tracks	Get a Playlist's Tracks	tracks
DELETE	/v1/playlists/{playlist_id}/tracks	Remove Tracks from a Playlist	-
PUT	/v1/playlists/{playlist_id}/tracks	Reorder a Playlist's Tracks	-
PUT	/v1/playlists/{playlist_id}/tracks	Replace a Playlist's Tracks	-
PUT	/v1/playlists/{playlist_id}/images	Upload a Custom Playlist Cover Image


Credit - https://github.com/guilhermesad/rspotify
