class BookmarksController < ApplicationController
  before_action :set_movie, :set_list

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @list = List.new(list_params)
    @movies = Bookmark.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie = @movie
    @bookmark.list = list_params
    if @bookmark.save!
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark.delete(bookmark_params)
  end

  private

  def list_params
    params.require(:list).permit(:comment)
  end

   def bookmark_params
    params.require(:bookmark).permit(:)
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_list
    @list = List.find(params[:list_id])
  end
end
