class Types::CustomAward < Types::BaseObject
  field :id, ID, null: false
  field :category, String, null: true
  field :title, String, null: true
  field :description, String, null: true
  field :employee, Types::Employee,  null: true
  field :editable, Boolean, null: true

end
