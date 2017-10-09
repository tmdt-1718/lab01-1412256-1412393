class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.string :avatar
      t.integer :user_id
      t.integer :views

      t.timestamps
    end
  end
end
