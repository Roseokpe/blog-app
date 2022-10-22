require 'rails_helper'
require 'ffi'

RSpec.describe Comment, type: :model do
  subject do
    Comment.new(user_id: 1, post_id: 1, text: 'This is a comment')
    before { subject.save }

    it 'user_id should be present' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it 'post_id should be present' do
      subject.post_id = nil
      expect(subject).to_not be_valid
    end

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'text should not be too long' do
      subject.text = 'a' * 1001
      expect(subject).to_not be_valid
    end
  end
end
