class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[index create]

  def index
    @users = User.all
    @users = @users.map { |u| UserSerializer.new(u) }
    render json: { users: @users }, status: :ok
  end

  def show
    user = User.find(params[:id])
    render json: { user: UserSerializer.new(user) }, status: :ok
  end

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)

    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :not_acceptable
    end
  end

  # ------------------------------- #

  # def spotify
  #   if params[:error]
  #     puts "LOGIN ERROR", params
  #     redirect_to "http://localhost:3001/login/failure"
  #   else
  #     body = {
  #       grant_type: "authorization_code",
  #       code: params[:code],
  #       redirect_uri: "localhost:3001",
  #       client_id: "6dd9a817b20d40da87c98bb33a796dce",
  #       client_secret: "86244d087e364c5d8e009fade414634a"
  #     }
  #     auth_response = RestClient.post("https://accounts.spotify.com/api/token", body)
  #     auth_params = JSON.parse(auth_response.body)
  # end

  # ------------------------------- #

  # def spotify
  #   spotify_user = RSpotify::User.new(request.env['omniauth.auth'])
    # # Now you can access user's private data, create playlists and much more
    #
    # # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"
    #
    # # Create playlist in user's Spotify account
    # playlist = spotify_user.create_playlist!('my-awesome-playlist')
    #
    # # Add tracks to a playlist in user's Spotify account
    # tracks = RSpotify::Track.search('Know')
    # playlist.add_tracks!(tracks)
    # playlist.tracks.first.name #=> "Somebody That I Used To Know"
    #
    # # Access and modify user's music library
    # spotify_user.save_tracks!(tracks)
    # spotify_user.saved_tracks.size #=> 20
    # spotify_user.remove_tracks!(tracks)
    #
    # albums = RSpotify::Album.search('launeddas')
    # spotify_user.save_albums!(albums)
    # spotify_user.saved_albums.size #=> 10
    # spotify_user.remove_albums!(albums)
    #
    # # Use Spotify Follow features
    # spotify_user.follow(playlist)
    # spotify_user.follows?(artists)
    # spotify_user.unfollow(users)
    #
    # # Get user's top played artists and tracks
    # spotify_user.top_artists #=> (Artist array)
    # spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)
    #
    # # Check doc for more
  # end

  # ------------------------------- #


  private

  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name, :profile_picture)
  end
end
