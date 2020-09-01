require 'rails_helper'

RSpec.describe Follow, type: :model do
  subject { Follow.new(following_id: '1', follower_id: '2')}

  before { subject.save }
  it 'following id should be present' do
    subject.following_id = nil
    expect(subject).to_not be_valid
  end

  before { subject.save }
  it 'follower id should be present' do
    subject.follower_id = nil
    expect(subject).to_not be_valid
  end
end
