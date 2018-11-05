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

require 'rails_helper'

RSpec.describe Employee, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
