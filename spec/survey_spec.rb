require 'spec_helper'

describe Survey do
  it { should have_many :questions}

  it 'validates the presence of name' do
    survey = Survey.new({:name => ''})
    expect(survey.save).to eq false
  end
end


