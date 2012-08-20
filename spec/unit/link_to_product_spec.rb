require 'spec_helper'

describe ApplicationHelper do
  let(:helper) {
    Object.new.extend ApplicationHelper
  }

  let(:product) { mock('product') }

  let(:spree_paths) { mock('spree paths') }

  describe '#link_to_product' do
    it 'should delegate to #link_to and #spree' do
      product_name = 'Test Product'
      product_path = '/products/test-product'
      product_link = "<a href='#{product_path}'>#{product_name}</a>"

      product.stub(:name => 'Test Product')
      helper.stub(:spree).and_return(spree_paths)
      spree_paths.stub(:product_path).with(product).and_return(product_path)
      helper.stub(:link_to).with(product_name, product_path).and_return(product_link)

      helper.link_to_product(product).should == product_link
    end
  end
end
