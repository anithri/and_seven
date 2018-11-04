class AddEmployeeGroupsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :employees, :user_groups, column_options: {type: :uuid}
  end
end
