class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)

    if @bookmark.save
      FetchOgpInfoJob.perform_later(@bookmark.id)
      redirect_to @bookmark, notice: 'Bookmark was successfully created.'
    else
      render :new
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    @bookmark.fetch_ogp_info unless @bookmark.title.present?
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end
end
