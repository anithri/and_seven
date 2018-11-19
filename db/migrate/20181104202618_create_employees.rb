class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees, id: :uuid do |t|
      t.string :username
      t.string :name
      t.string :email
      t.string :phone
      t.string :mobile
      t.integer :gust_id
      t.integer :pc3_id
      t.string :remember_digest
      t.boolean :is_gone, default: false

      t.timestamps
    end
    add_index :employees, :email, unique: true
    add_index :employees, :name, unique: true
    add_index :employees, :remember_digest, unique: true
    add_index :employees, :username, unique: true
  end
end
