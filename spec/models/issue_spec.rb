require 'rails_helper'

RSpec.describe Issue, type: :model do
  it 'must have a name' do
    expect(Issue.new(name: nil)).not_to be_valid
  end
end
