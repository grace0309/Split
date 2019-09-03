class RemoveUsersFromTransactions < ActiveRecord::Migration[5.2]
  def change
    remove_column :transactions, :user_, :string
  end
end
