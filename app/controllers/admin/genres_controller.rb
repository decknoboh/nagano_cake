class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  def index
    @genre = Genre.new
    @genres = Genre.page(params[:page]).per(5)
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.page(params[:page]).per(5)
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres_path(@genre)
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
