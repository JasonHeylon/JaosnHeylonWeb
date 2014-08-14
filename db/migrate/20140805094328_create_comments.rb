class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :email
      t.references :article, index: true
      t.text :content
      t.integer :reply_to_id

      t.timestamps
    end
  end
end
