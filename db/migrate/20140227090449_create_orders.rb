class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :status

      t.timestamps
    end
  end
end
