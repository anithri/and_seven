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

require 'rails_helper'

RSpec.describe Employee, type: :model do
  it 'has a valid factory' do
    expect(build(:employee)).to be_valid
  end

  let(:attributes) do
    {
      name: 'Bruce Wayne',
      username: 'batman',
      email: 'greatest_detective@batcave.org'
    }
  end

  let(:employee) {create(:employee, **attributes)}

  describe 'model validations' do
    it 'should not allow duplicate names' do
      expect(employee).to allow_value(attributes[:email]).for(:email)
      expect(employee).to allow_value(attributes[:name]).for(:name)
      expect(employee).to allow_value(attributes[:username]).for(:username)

    end

    it 'should check for presence' do
      expect(employee).to validate_presence_of :email
      expect(employee).to validate_presence_of :name
      expect(employee).to validate_presence_of :username
    end
    it 'should check for uniqueness' do
      expect(employee).to validate_uniqueness_of :email
      expect(employee).to validate_uniqueness_of :name
      expect(employee).to validate_uniqueness_of :username
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
