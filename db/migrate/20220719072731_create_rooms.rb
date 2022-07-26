class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
  t.references :room
  t.references :user
      t.timestamps
    end
  end
end
