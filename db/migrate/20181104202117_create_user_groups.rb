class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups, id: :uuid do |t|
      t.string :name
      t.integer :access, default: 0

      t.timestamps
    end
    add_index :user_groups, :name, unique: true
  end
end
