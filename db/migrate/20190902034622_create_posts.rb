class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :store_name
      t.string :details
      t.string :discount
      t.references :category, foreign_key: true
      t.integer :quota
      t.integer :starting_contribution
      t.integer :total_contribution
      t.string :units
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :status, default: true
      t.string :image_url

      t.timestamps
    end
  end
end
