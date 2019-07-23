class SpotifyloginController < ApplicationController

  def create
    # query_params = {
    #   client_id: "6dd9a817b20d40da87c98bb33a796dce",
    #   response_type: "code",
    #   redirect_uri: "localhost:3001",
    #   scope: "playlist-modify-public streaming user-library-read user-library-modify user-read-currently-playing user-read-email user-modify-playback-state",
    #   show_dialog: true
    # }

    url = "https://accounts.spotify.com/authorize?client_id=6dd9a817b20d40da87c98bb33a796dce&response_type=code&scope=playlist-modify-public+streaming+user-library-read+user-library-modify+user-read-currently-playing+user-read-email+user-modify-playback-state&redirect_uri=https://localhost:3001&show_dialog=true"

    redirect_to "#{url}"
  end

end
