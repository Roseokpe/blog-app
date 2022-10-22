require 'rails_helper'
require 'ffi'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
             bio: 'singer for Nigeria', posts_counter: 0)

    before { subject.save }

    context 'Return valid data' do
      it 'name should be present' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'photo should be present' do
        subject.photo = nil
        expect(subject).to_not be_valid
      end

      it 'bio should be present' do
        subject.bio = nil
        expect(subject).to_not be_valid
      end

      it 'posts_counter should be present' do
        subject.posts_counter = nil
        expect(subject).to_not be_valid
      end

      it 'name should not be too long' do
        subject.name = 'a' * 51
        expect(subject).to_not be_valid
      end
      it 'should not accept negative post_counter' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
      end
      it 'should not accept non numerical post_counter' do
        subject.posts_counter = 'count'
        expect(subject).to_not be_valid
      end
    end
  end
end
