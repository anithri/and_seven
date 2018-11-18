class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :username
      t.string :display_name
      t.boolean :is_gone, default: false
      t.integer :gust_id
      t.integer :pc3_id
      t.string :email
      t.string :phone
      t.string :mobile
      t.string :remember_digest

      t.timestamps
    end
    add_index :employees, :username, unique: true
    add_index :employees, :display_name, unique: true
    add_index :employees, :remember_digest, unique: true
  end
end
