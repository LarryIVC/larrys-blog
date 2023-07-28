require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', post_counter: 0) }
  before { subject.save }

  it 'Name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid

    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'Name must be present' do
    subject.name = nil
    expect(subject).to_not be_valid

    subject.name = 'Tom'
    expect(subject).to be_valid
  end

  it 'post_counter must be integer' do
    subject.post_counter = 'a'
    expect(subject).to_not be_valid

    subject.post_counter = 4
    expect(subject).to be_valid
  end

  it 'post_counter must be greater than or equal to 0' do
    subject.post_counter = -1
    expect(subject).to_not be_valid

    subject.post_counter = 4
    expect(subject).to be_valid
  end

  it '#return_three_recent_posts' do
    number = User.return_three_recent_posts(subject.id).length
    expect(number).to be <= 3
  end
end
