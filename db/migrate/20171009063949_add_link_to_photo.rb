class AddLinkToPhoto < ActiveRecord::Migration[5.1]
  def change
    add_column :photos, :link, :string
  end
end
