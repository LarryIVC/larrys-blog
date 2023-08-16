require 'rails_helper'

describe 'Post#show', type: :feature do
  let!(:user1) do
    User.create(
      name: 'Larry',
      photo: 'https://randomuser.me/api/portraits/men/73.jpg',
      bio: 'I am a cool guy',
      post_counter: 4
    )
  end

  let!(:post1) do
    Post.create(
      title: 'My first post',
      text: 'This is my first post',
      author: user1
    )
  end

  let!(:comment1) do
    Comment.create(
      author: user1,
      post: post1,
      text: 'Hi larry!'
    )
  end

  let!(:like1) do
    Like.create(
      author: user1,
      post: post1
    )
  end

  it 'I can see the post title' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('My first post')
  end

  it 'I can see who wrote the post' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('Larry')
  end

  it 'I can see how many comments it has' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes it has' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('likes: 1')
  end

  it 'I can see the post body' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('This is my first post')
  end

  it 'I can see the username of each commentor' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('Larry:')
  end

  it 'I can see the comment each commentor left' do
    visit "/users/#{user1.id}/posts/#{post1.id}"

    expect(page).to have_content('Hi larry!')
  end
end
