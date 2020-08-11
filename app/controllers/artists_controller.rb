class ArtistsController < ApplicationController
    before_action :find_artist, only: [:show, :edit, :update]

    def index
        @artists = Artist.all
    end

    def show
        find_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(artist_params)
        if @artist.valid?
            redirect_to artist_path(@artist)
        else
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end

    def edit
        find_artist
    end

    def update
        find_artist
        @artist.update(artist_params)
        redirect_to artist_path(@artist)
    end

    private
    def artist_params
        params.require(:artist).permit(:name, :age, :title, instrument_ids:[], instruments_attributes: [:name, :classification])
    end

    def find_artist
        @artist = Artist.find(params[:id])
    end

end
