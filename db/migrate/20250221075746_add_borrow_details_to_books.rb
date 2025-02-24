class AddBorrowDetailsToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :issue_date, :date
    add_column :books, :return_date, :date
    add_column :books, :fines, :integer
  end
end
