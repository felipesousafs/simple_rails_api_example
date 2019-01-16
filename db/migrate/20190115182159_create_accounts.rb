class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :owner
      t.decimal :balance, default: 0.0

      t.timestamps
    end
  end
end
