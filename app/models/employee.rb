# == Schema Information
#
# Table name: employees
#
#  id              :uuid             not null, primary key
#  email           :string
#  is_gone         :boolean          default(FALSE)
#  mobile          :string
#  name            :string
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
#  index_employees_on_email            (email) UNIQUE
#  index_employees_on_name             (name) UNIQUE
#  index_employees_on_remember_digest  (remember_digest) UNIQUE
#  index_employees_on_username         (username) UNIQUE
#

class Employee < ApplicationRecord
  include ActiveModel::SecurePassword
  has_secure_token :remember_digest

  validates :email, uniqueness: true, presence: true
  validates :name, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true

  has_and_belongs_to_many :user_groups

  scope :is_gone?, -> {where(is_gone: true)}
  scope :still_here?, -> {where(is_gone: false)}

  def still_here?
    !is_gone?
  end
end
