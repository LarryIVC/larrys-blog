require 'rails_helper'

RSpec.describe Post, type: :model do
  person1 = User.new(name: 'Tom', photo: 'https://unplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.new(author_id: person1, title: 'My first post', text: 'This is my first post.') }
  before { subject.save }

  it 'Title must not be blank' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'Title must be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must be less than or equal to 250 characters' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be integer' do
    subject.comments_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'comments_counter must be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be integer' do
    subject.likes_counter = 'a'
    expect(subject).to_not be_valid
  end

  it 'likes_counter must be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
