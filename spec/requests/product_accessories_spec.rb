require 'spec_helper'

describe 'product accessories' do
  it 'should list accessories on product page', :js => true do
    product = Factory.create(:product)
    accessory = Factory.create(:product)

    visit spree.product_path(product)

    page.should have_content(accessory.name)
  end
end
