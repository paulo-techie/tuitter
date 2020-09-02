require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:jdoe1) { User.first }
  let(:jdoe2) { User.last }
  subject { Follow.new(following_id: jdoe1.id, follower_id: jdoe2.id) }

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

  before { subject.save }
  it 'users should follow each other' do
    expect(subject).to be_valid
  end
end
