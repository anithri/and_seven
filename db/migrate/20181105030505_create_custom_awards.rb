class CreateCustomAwards < ActiveRecord::Migration[5.2]
  def change
    create_table :custom_awards, id: :uuid do |t|
      t.string :title
      t.string :description
      t.integer :category, default: 0
      t.references :employee, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
