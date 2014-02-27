class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :isbn
      t.string :slot
      t.integer :total_stock
      t.integer :avl_stock
      t.integer :lang_type

      t.timestamps
    end
  end
end
