require('spec_helper')

describe Product do
  describe('#purchase') do
    it('will return an associated purchase') do
      purchase = Purchase.create()
      product = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => false})
      expect(product.purchase()).to(eq(purchase))
    end
  end
end
