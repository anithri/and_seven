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
#  index_employees_on_display_name     (display_name) UNIQUE
#  index_employees_on_remember_digest  (remember_digest) UNIQUE
#  index_employees_on_username         (username) UNIQUE
#

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'has a valid factory' do
    expect(build(:employee)).to be_valid
  end

  let(:attributes) do
    {
      display_name: 'Bruce Wayne'
    }
  end

  let(:employee) {create(:employee, **attributes)}

  describe 'model validations' do
    it 'should not allow duplicate display_names' do
      expect(employee).to allow_value(attributes[:display_name]).for(:display_name)
    end

    it 'should check for presence' do
      expect(employee).to validate_presence_of :display_name
    end
    it 'should check for uniqueness' do
      expect(employee).to validate_uniqueness_of :display_name
    end
  end

  describe 'authentication' do
    it 'should have a secure token' do
      expect(employee).to have_secure_token :remember_digest
    end
  end

  describe 'model associations' do
    it 'should have and belong to many user_groups' do
      expect(employee).to have_and_belong_to_many :user_groups
    end
  end
end
