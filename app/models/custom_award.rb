# == Schema Information
#
# Table name: custom_awards
#
#  id          :uuid             not null, primary key
#  category    :integer          default("award")
#  description :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  employee_id :uuid
#
# Indexes
#
#  index_custom_awards_on_employee_id  (employee_id)
#
# Foreign Keys
#
#  fk_rails_...  (employee_id => employees.id)
#

class CustomAward < ApplicationRecord
  belongs_to :employee
  attr_accessor :editable
  enum category: {award: 0, milestone: 1}

  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :employee, presence: true

  def editable_by(user)
    @can_edit = (self.employee_id == user.id)
  end
end
