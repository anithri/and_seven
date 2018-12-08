class Types::Employee < Types::BaseObject
  field :id, ID, null: false
  field :name, String, null: false
  field :is_gone, Boolean, null: true
  field :phone, String, null: true
  field :mobile, String, null: true
  field :email, String, null: false
  field :user_groups, [Types::UserGroup], null: true
  field :custom_awards, [Types::CustomAward], null: true
end
