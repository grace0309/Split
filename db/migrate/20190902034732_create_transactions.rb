class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      t.string :user_
      t.integer :contribution

      t.timestamps
    end
  end
end
