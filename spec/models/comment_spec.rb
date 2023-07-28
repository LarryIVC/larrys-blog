require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:person1) do
    User.create(name: 'Tom',
                photo: 'https://unplash.com/photos/F_-0BxGuVvo',
                bio: 'Teacher from Mexico.',
                post_counter: 2)
  end

  let(:post1) do
    Post.create(author_id: person1.id,
                title: 'My first post',
                text: 'This is my first post.',
                comments_counter: 2,
                likes_counter: 2)
  end

  subject do
    Comment.new(author_id: person1.id,
                post_id: post1.id,
                text: 'This is my first comment.')
  end

  before { subject.save }

  it 'text must not be blank' do
    subject.text = nil
    expect(subject).to_not be_valid

    subject.text = 'This is the comment'
    expect(subject).to be_valid
  end
end
