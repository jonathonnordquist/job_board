require 'rails_helper'

RSpec.describe UserAppsController, type: :controller do
  it 'new method renders the application view' do
    p Job.all
    get(:new, :id => 1)
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end
end
