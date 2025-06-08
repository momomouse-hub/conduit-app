class AddTagListToArticles < ActiveRecord::Migration[8.0]
  def change
    add_column :articles, :tag_list, :string
  end
end
