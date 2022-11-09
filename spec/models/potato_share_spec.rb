require 'rails_helper'

RSpec.describe PotatoShare, type: :model do
  subject { build(:potato_share) }

  describe 'Validation' do
    context 'main factory' do
      it 'should be valid' do
        expect(subject.valid?).to eq(true)
      end
    end

    context 'missing value' do
      it 'should not be valid' do
        subject.value = nil
        expect(subject.valid?).to eq(false)
      end
    end
  end
end
