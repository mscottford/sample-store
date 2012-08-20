Spree::Product.class_eval do
  def has_accessories?
    self.accessories.count > 0
  end
end
