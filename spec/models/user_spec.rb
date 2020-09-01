require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(fullname: 'john doe', username: 'jdoe')}

  before { subject.save }
  it 'username should be present' do
    subject.username = nil
    expect(subject).to_not be_valid
  end

  before { subject.save }
  it 'fullname should be present' do
    subject.fullname = nil
    expect(subject).to_not be_valid
  end
end
