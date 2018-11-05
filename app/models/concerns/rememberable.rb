module Rememberable
  extend ActiveSupport::Concern

  included do
    attr_accessor :remember_token
    has_secure_token :remember_token
  end

  class_methods do
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ?
               BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      warn string, cost
      BCrypt::Password.create(string, cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember!
    self.remember_token = self.class.new_token
    update_attribute :remember_digest, self.class.digest(remember_token)
  end

  def remembered?(token)
    return false unless remember_digest && token
    BCrypt::Password.new(remember_digest).is_password?(token)
  end
end
