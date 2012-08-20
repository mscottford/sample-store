require 'spec_helper'

describe Spree::Product do
  describe '#has_accessories?' do
    it 'should return false if there are no accessories' do
      product = Spree::Product.create!(
        :name => 'Shirt',
        :price => 10,
        :available_on => 1.day.ago)

      product.should_not have_accessories
    end

    it 'should return true if there are accessories' do
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


      product.should have_accessories
    end
  end
end
