class AddStarToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :star, :float, null: false, default: 0
    add_column :books, :tag, :string
  end
end
