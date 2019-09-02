class ChangeImageToPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :image_url, :photo
  end
end
