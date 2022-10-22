require 'rails_helper'
require 'ffi'

RSpec.describe Like, type: :model do
  subject do
    Like.new(user_id: 1, post_id: 1)
    before { subject.save }

    it 'user_id should be present' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'post_id should be present' do
      subject.post_id = nil
      expect(subject).to_not be_valid
    end
  end
end