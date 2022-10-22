require 'rails_helper'

RSpec.describe Post, type: :model do
  subject{Post.new(title: 'My first post', text: 'This is my first post', author_id: 1, comments_counter: 1, likes_counter: 1)}
    before{subject.save}

    it 'title should be present' do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it 'text should be present' do
        subject.text = nil
        expect(subject).to_not be_valid
    end

    it 'author_id should be present' do
        subject.author_id = nil
        expect(subject).to_not be_valid
    end

    it 'comments_counter should be present' do
        subject.comments_counter = nil
        expect(subject).to_not be_valid
    end

    it 'likes_counter should be present' do
        subject.likes_counter = nil
        expect(subject).to_not be_valid
    end

    it 'title should not be too long' do
        subject.title = 'a' * 251
        expect(subject).to_not be_valid
    end 

    it 'text should not be too long' do
        subject.text = 'a' * 1001
        expect(subject).to_not be_valid
    end

end