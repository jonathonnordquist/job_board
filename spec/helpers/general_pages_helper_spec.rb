require 'rails_helper'

RSpec.describe GeneralPagesHelper, type: :helper do
  it 'formatted_title method returns title base if called with no string' do
    expect(helper.formatted_title).to eq('Rails Job Board')
  end
  
  it 'formatted_title method returns title base plus parameter' do
    expect(helper.formatted_title("Test")).to eq('Test | Rails Job Board')
  end
end
