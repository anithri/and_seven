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
  it 'has a valid factory' do
    expect(build(:user_group)).to be_valid
    expect(build(:guest_access)).to be_valid
    expect(build(:user_access)).to be_valid
    expect(build(:power_user_access)).to be_valid
    expect(build(:limited_admin_access)).to be_valid
    expect(build(:admin_access)).to be_valid
    expect(build(:root_access)).to be_valid
  end

  let(:attributes) do
    {
      name: 'This Team'
    }
  end

  let(:user_group) {create(:user_group, **attributes)}

  describe 'model validations' do
    it 'should not allow duplicate names' do
      expect(user_group).to allow_value(attributes[:name]).for(:name)
    end

    it 'should check for presence' do
      expect(user_group).to validate_presence_of :name
    end
    it 'should check for uniqueness' do
      expect(user_group).to validate_uniqueness_of :name
    end
  end

  describe 'model associations' do
    it 'should have and belong to many employees' do
      expect(user_group).to have_and_belong_to_many :employees
    end
  end
end
