# == Schema Information
#
# Table name: employees
#
#  id              :uuid             not null, primary key
#  display_name    :string
#  email           :string
#  is_gone         :boolean          default(FALSE)
#  mobile          :string
#  phone           :string
#  remember_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  gust_id         :integer
#  pc3_id          :integer
#
# Indexes
#
#  index_employees_on_display_name  (display_name) UNIQUE
#  index_employees_on_username      (username) UNIQUE
#

class Employee < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_token :remember_digest

  has_and_belongs_to_many :user_groups

  def remember_token
    BCrypt::Password.create(remember_digest)
  end

  def remember!
    self.regenerate_remember_digest
  end

  def forget!
    self.update(remember_digest: nil)
  end

  def remembered?(token)
    token == remember_token
  end

  def authenticate(_password)
    true
  end

  def name
    display_name
  end
end
