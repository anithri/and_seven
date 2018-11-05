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

require 'rails_helper'

RSpec.describe CustomAward, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
