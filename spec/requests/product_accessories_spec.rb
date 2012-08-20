require 'spec_helper'

describe 'product accessories' do
  it 'should list accessories on product page', :js => true do
    product = Spree::Product.create!(
      :name => 'Shirt',
      :price => 10,
      :available_on => 1.day.ago)
    accessory = Spree::Product.create!(
      :name => 'Shoes',
      :price => 10,
      :available_on => 1.day.ago)

    accessory_relation_type = Spree::RelationType.find_by_name('Accessories')
    Spree::Relation.create!(
      :relation_type => accessory_relation_type,
      :relatable => product,
      :related_to => accessory)

    visit spree.product_path(product)

    page.should have_content(accessory.name)
  end
end
