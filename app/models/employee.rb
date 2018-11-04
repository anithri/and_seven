# == Schema Information
#
# Table name: employees
#
#  id           :uuid             not null, primary key
#  display_name :string
#  email        :string
#  is_gone      :boolean          default(FALSE)
#  mobile       :string
#  phone        :string
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  gust_id      :integer
#  pc3_id       :integer
#
# Indexes
#
#  index_employees_on_display_name  (display_name) UNIQUE
#  index_employees_on_username      (username) UNIQUE
#

class Employee < ApplicationRecord
  has_and_belongs_to_many :user_groups
end
