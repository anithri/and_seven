# frozen_string_literal: true

class Types::User < Types::BaseObject
  description 'User'

  field :id, ID, null: false
  field :name, String, null: true
end
