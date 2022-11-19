class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[destroy]
  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    @bookmark.save
    redirect_to bookmarks_path
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmarks_path
  end

  private

  def set_bookmark
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:bookmark).permit(:comment)
  end
end
