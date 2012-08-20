require 'spec_helper'

describe 'home' do
  it 'should load home page' do
    visit '/'
    page.should have_content('Home')
  end
end
