module ApplicationHelper
  def link_to_product(product)
    link_to product.name, spree.product_path(product)
  end
end
