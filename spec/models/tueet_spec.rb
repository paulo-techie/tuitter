require 'rails_helper'

RSpec.describe Tueet, type: :model do
  subject { Tueet.new(tueet: 'a new tueet')}

  before { subject.save }
  it 'tueet should be present' do
    subject.tueet = nil
    expect(subject).to_not be_valid
  end
end
