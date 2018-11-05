class Types::UserGroup < Types::BaseObject
  field :id, ID, null: false
  field :access, String, null: true
  field :name, String, null: true
  field :employees, [Types::Employee], null: true

end
