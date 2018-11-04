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

require 'rails_helper'

RSpec.describe UserGroup, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
