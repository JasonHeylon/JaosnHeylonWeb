class AddUrlNameToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :named_url, :string
    add_index :articles, :named_url
  end
end
