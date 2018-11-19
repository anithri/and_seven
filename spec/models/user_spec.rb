require 'rails_helper'
FAKE_TOKEN = BCrypt::Password.create('Fake Token').to_s
RSpec.describe User, type: :model do
  it 'should have a valid employee factory ' do
    expect(build(:employee)).to be_valid
  end

  let(:user) {User.from(create(:employee))}

  describe 'via employee' do
    it 'should have employee attributes' do
      User::EMPLOYEE_FIELDS.each do |field|
        expect(user).to delegate_method(field).to(:employee)
      end
    end
  end

  describe 'authentication' do
    let(:auth_user) {
      User.from(Employee.new)
    }
    it 'should have a remember_token' do
      expect(auth_user.remember_token).to be_a String
    end

    it 'should forget!' do
      token = user.remember_token.to_s
      user.forget!
      expect(user.remember_token.to_s).to_not be token
    end

    it 'should remember!' do
      token = user.remember_token.to_s
      user.remember!
      expect(user.remember_token.to_s).to_not be token
    end

    it 'should check if remembered?' do
      token = user.remember_token.to_s
      expect(user.remembered?(token)).to be_truthy
      expect(user.remembered?(FAKE_TOKEN)).to be_falsey
    end

  end


end
