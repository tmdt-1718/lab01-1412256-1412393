class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :name
      t.integer :album_id
      t.integer :view

      t.timestamps
    end
  end
end
