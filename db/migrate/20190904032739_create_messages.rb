class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.text :message_content

      t.timestamps
    end
  end
end
