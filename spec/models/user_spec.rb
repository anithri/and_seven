require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have a valid employee factory ' do
    expect(build(:employee)).to be_valid
  end

  let(:user) {User.new(create(:employee))}

  describe 'via employee' do
    it 'should have employee attributes' do
      User::EMPLOYEE_FIELDS.each do |field|
        expect(user).to delegate_method(field).to(:employee)
      end
    end
  end
end
