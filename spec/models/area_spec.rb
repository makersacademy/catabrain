require 'rails_helper'

RSpec.describe Area, type: :model do
  it 'validates presence of name' do
    expect(Area.new(name:nil)).not_to be_valid
  end
end
