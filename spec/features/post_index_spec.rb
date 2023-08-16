require 'rails_helper'

describe 'Post#index', type: :feature do
  let!(:user1) do
    User.create(
      name: 'Larry',
      photo: 'https://randomuser.me/api/portraits/men/73.jpg',
      bio: 'I am a cool guy'
    )
  end

  before do
    15.times do |i|
      Post.create(
        author: user1,
        title: "Post##{i + 1}",
        text: "This is my #{i + 1} post!"
      )
    end
  end

  let!(:comment1) do
    Comment.create(
      author: user1,
      post: Post.first,
      text: 'Hi larry!'
    )
  end

  it 'I can see the user profile picture' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_css("img[src*='#{user1.photo}']")
  end

  it 'I can see the user username' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_content(user1.name)
  end

  it 'I can see the number of posts the user has written' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_content('Number of posts: 15')
  end

  it 'I can see a post title' do
    visit "/users/#{user1.id}/posts"
    expect(page).to have_content('Post#1')
    expect(page).to have_content('Post#10')
  end

  it 'I can see some of the post body' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_content('This is my 1 post!')
  end

  it 'I can see the first comments on a post.' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_content('Hi larry!')
  end

  it 'I can see how many comments a post has' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_content('Comments: 1')
  end

  it 'I can see how many likes a post has' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_content('Likes: 0')
  end

  it 'I can see a section for pagination if there are more posts than fit on the view' do
    visit "/users/#{user1.id}/posts"

    expect(page).to have_button('Pagination')
  end

  it 'When I click on a post, it redirects me to that posts show page' do
    post = Post.first
    post.title = 'This is a post title'
    post.save

    visit "/users/#{user1.id}/posts"
    click_link post.title

    expect(page).to have_current_path("/users/#{user1.id}/posts/#{post.id}")
  end
end
