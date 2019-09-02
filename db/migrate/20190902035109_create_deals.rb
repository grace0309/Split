class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.string :title
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
