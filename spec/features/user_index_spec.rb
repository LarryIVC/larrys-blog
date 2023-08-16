require 'rails_helper'

describe 'User#index', type: :feature do
  let!(:user1) do
    User.create(
      name: 'Larry',
      photo: 'https://randomuser.me/api/portraits/men/73.jpg',
      bio: 'I am a cool guy',
      post_counter: 5
    )
  end

  let!(:user2) do
    User.create(
      name: 'Muneeb',
      photo: 'https://randomuser.me/api/portraits/men/65.jpg',
      bio: 'I am a happy guy',
      post_counter: 1
    )
  end

  it 'I can see the username of all other users' do
    visit '/'
    expect(page).to have_content('Larry')
    expect(page).to have_content('Muneeb')
  end

  it 'I can see the profile picture for each user' do
    visit '/'

    expect(page).to have_css('img[alt="Larry"]')
    expect(page).to have_css('img[alt="Muneeb"]')

    expect(page).to have_css("img[src*='73.jpg']")
    expect(page).to have_css("img[src*='65.jpg']")
  end

  it 'I can see the number of posts each user has written' do
    visit '/'
    expect(page).to have_content('Number of post: 5')
    expect(page).to have_content('Number of post: 1')
  end

  it 'When I click on a user, I am redirected to that users show page' do
    visit '/'
    click_on 'Larry'
    expect(page).to have_current_path("/users/#{user1.id}")

    visit '/'
    click_on 'Muneeb'
    expect(page).to have_current_path("/users/#{user2.id}")
  end
end
