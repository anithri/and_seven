# == Schema Information
#
# Table name: user_groups
#
#  id         :uuid             not null, primary key
#  access     :integer          default("guest")
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_groups_on_name  (name) UNIQUE
#

class UserGroup < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_and_belongs_to_many :employees
  enum access: {guest: 0, user: 1, power_user: 2, limited_admin: 3, admin: 4, root: 5}

  default_scope { order(:access) }
  scope :with_access, ->(min_level){where('access >= ?', min_level).limit(1)}

end
