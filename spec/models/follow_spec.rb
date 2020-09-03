require 'rails_helper'

RSpec.describe Follow, type: :model do
  let(:jdoe1) { User.create(fullname: 'john doe', username: 'john') }
  let(:jdoe2) { User.create(fullname: 'jane doe', username: 'jane') }
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

  it 'should have many tueets' do
    t = User.reflect_on_association(:tueets)
    expect(t.macro).to eq(:has_many)
  end

  it 'should be followed by many' do
    f = User.reflect_on_association(:followers)
    expect(f.macro).to eq(:has_many)
  end

  it 'should be able to follow many' do
    t = User.reflect_on_association(:following)
    expect(t.macro).to eq(:has_many)
  end
end
