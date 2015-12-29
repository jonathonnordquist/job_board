require 'rails_helper'

RSpec.describe GeneralPagesController, type: :controller do
  it 'home method renders home view' do
    get(:home)
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:home)
  end
  
  it 'help method renders help view' do
    get(:help)
    
    expect(response).to have_http_status(200)
    expect(response).to render_template(:help)
  end
end
