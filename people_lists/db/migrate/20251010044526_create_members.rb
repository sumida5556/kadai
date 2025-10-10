# db/migrate/XXXXXXXXXXXXXX_create_members.rb

class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.string :name, null: false
      t.float :height, null: false
      t.float :weight, null: false

      t.timestamps
    end
    add_index :members, :name, unique: true
  end
end
