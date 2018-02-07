class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    # @song = Song.new(song_params)
    # @artist=Artist.new
    # @genre=Genre.new
    # @note=Note.new
    # @song.note_contents=(@note)
    # @artist.name=params[:song][:artist_name]
    # @artist.save
    # @genre.id=params[:song][:genre_id]
    # @song.genre_id=@genre.id
    # @song.artist_id=@artist.id
    # @song.save
    # if @song.save
    #   redirect_to song_path(@song)
    # else
    #   render :new
    # end
    song = Song.create(song_params)
    redirect_to controller: 'songs', action: 'index'
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])

    @song.update(song_params)

    if @song.save
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    flash[:notice] = "Song deleted."
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :genre_id, note_contents: [])
  end
end
