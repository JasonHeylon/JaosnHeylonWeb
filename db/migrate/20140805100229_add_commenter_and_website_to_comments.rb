class AddCommenterAndWebsiteToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :commenter, :string
  	add_column :comments, :website, :string
  end
end
