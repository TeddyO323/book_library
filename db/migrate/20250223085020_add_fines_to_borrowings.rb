class AddFinesToBorrowings < ActiveRecord::Migration[7.0]
  def change
    add_column :borrowings, :fines, :decimal, precision: 8, scale: 2, default: 0.00
  end
end
