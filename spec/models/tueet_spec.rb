require 'rails_helper'

RSpec.describe Tueet, type: :model do
  let(:jdoe1) { User.first }
  subject { Tueet.new(tueet: 'a new tueet', user: jdoe1) }

  before { subject.save }
  it 'tueet should be present' do
    subject.tueet = nil
    expect(subject).to_not be_valid
  end

  before { subject.save }
  it 'tueet should be present' do
    expect(subject).to be_valid
  end
end
