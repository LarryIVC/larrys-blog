require 'rails_helper'

describe 'User#show', type: :feature do
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

  let!(:post2) do
    Post.create(
      title: 'My second post',
      text: 'This is my second post',
      author: user1
    )
  end

  let!(:post3) do
    Post.create(
      title: 'My thrid post',
      text: 'This is my third post',
      author: user1
    )
  end

  let!(:post4) do
    Post.create(
      title: 'My fourth post',
      text: 'This is my fourth post',
      author: user1
    )
  end

  it 'I can see the user profile picture' do
    visit "/users/#{user1.id}"

    expect(page).to have_css("img[src*='#{user1.photo}']")
  end

  it 'I can see the user username' do
    visit "/users/#{user1.id}"

    expect(page).to have_content(user1.name)
  end

  it 'I can see the number of posts the user has written' do
    visit "/users/#{user1.id}"

    expect(page).to have_content('Number of post:4')
  end

  it 'I can see the user bio' do
    visit "/users/#{user1.id}"

    expect(page).to have_content(user1.bio)
  end

  it 'I can see the 3 recent user posts' do
    visit "/users/#{user1.id}"

    expect(page).to have_content(post2.title)
    expect(page).to have_content(post3.title)
    expect(page).to have_content(post4.title)

    expect(page).to_not have_content(post1.title)
  end

  it 'I can see a button that lets me view all of a user posts' do
    visit "/users/#{user1.id}"

    expect(page).to have_link('See all posts')
    expect(page).to have_link('See all posts', href: "/users/#{user1.id}/posts")
  end

  it 'When I click a user post, it redirects me to that post show page' do
    visit "/users/#{user1.id}"
    click_link(post2.title)
    expect(current_path).to eq("/users/#{user1.id}/posts/#{post2.id}")

    visit "/users/#{user1.id}"
    click_link(post3.title)
    expect(current_path).to eq("/users/#{user1.id}/posts/#{post3.id}")

    visit "/users/#{user1.id}"
    click_link(post4.title)
    expect(current_path).to eq("/users/#{user1.id}/posts/#{post4.id}")
  end

  it 'When I click to see all posts, it redirects me to the user posts index page' do
    visit "/users/#{user1.id}"

    click_link('See all posts')

    expect(current_path).to eq("/users/#{user1.id}/posts")
  end
end
