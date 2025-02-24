class AddDetailsToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :genre, :string
    add_column :books, :pages, :integer
    add_column :books, :publisher, :string
    add_column :books, :language, :string
    add_column :books, :format, :string
  end
end
