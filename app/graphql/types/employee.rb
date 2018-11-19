class Types::Employee < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: true
  field :is_gone, Boolean, null: true
  field :user_groups, [Types::UserGroup], null: true
end
