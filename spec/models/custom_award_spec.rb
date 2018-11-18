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
  it 'has a valid factory' do
    expect(build(:custom_award)).to be_valid
  end

  let(:attributes) do
    {
      title: 'This Thing'
    }
  end

  let(:custom_award) {create(:custom_award, **attributes)}

  describe 'model validations' do
    it 'should not allow duplicate titles' do
      expect(custom_award).to allow_value(attributes[:title]).for(:title)
    end
    it 'should check for presence' do
      expect(custom_award).to validate_presence_of :description
      expect(custom_award).to validate_presence_of :employee
      expect(custom_award).to validate_presence_of :title
    end
    it 'should check for uniqueness' do
      expect(custom_award).to validate_uniqueness_of :title
    end
  end

  describe 'model associations' do
    it 'should belong to an employee' do
      expect(custom_award).to belong_to :employee
    end
  end
end
