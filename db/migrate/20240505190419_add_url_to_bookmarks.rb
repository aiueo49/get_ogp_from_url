class AddUrlToBookmarks < ActiveRecord::Migration[7.1]
  def change
    add_column :bookmarks, :url, :string
  end
end
