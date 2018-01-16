class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :type
      t.float :amount
      t.string :title
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
