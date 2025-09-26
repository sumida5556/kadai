class RenameBodyToContentInArticles < ActiveRecord::Migration[8.0]
  def change
    rename_column :articles, :body, :content
  end
end
