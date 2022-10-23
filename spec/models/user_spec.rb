require 'rails_helper'
require 'ffi'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'John', photo: 'https://www.google.com/url', bio: 'I am a software developer',
             posts_counter: 3)
  end

  before { subject.save }

  context 'Return valid user' do
    it 'should accept name' do
      expect(subject.name).to eq('John')
    end

    it 'should accept photo' do
      expect(subject.photo).to eq('https://www.google.com/url')
    end

    it 'should accept bio' do
      expect(subject.bio).to eq('I am a software developer')
    end

    it 'should accept posts_counter' do
      expect(subject.posts_counter).to eq(3)
    end

    context 'Return invalid user' do
      it 'should not accept blank name' do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it 'should not accept blank negative post counter' do
        subject.posts_counter = -1
        expect(subject).to_not be_valid
      end

      it 'should not accept blank non-integer post counter' do
        subject.posts_counter = 1.5
        expect(subject).to_not be_valid
      end
    end
  end
end