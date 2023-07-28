require 'rails_helper'

RSpec.describe Like, type: :model do
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
    Like.new(author_id: person1.id,
             post_id: post1.id)
  end

  it 'Is valid with valid attributes' do
    expect(subject).to be_valid
  end
end
