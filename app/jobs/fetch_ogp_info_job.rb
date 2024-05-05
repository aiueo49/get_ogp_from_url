class FetchOgpInfoJob < ApplicationJob
  queue_as :default

  def perform(bookmark_id)
    bookmark = Bookmark.find(bookmark_id)
    bookmark.fetch_ogp_info
  end
end
