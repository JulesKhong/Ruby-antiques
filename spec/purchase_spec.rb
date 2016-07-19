require('spec_helper')

describe Purchase do
  describe('#products') do
    it('returns the products for a purchase') do
      purchase = Purchase.create
      product = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => false})
      expect(purchase.products()).to(eq([product]))
    end
  end

  describe('.sold_between') do
    it('will return all sales between a date range') do
      purchase = Purchase.create()
      purchase2 = Purchase.create({:created_at => DateTime.now - 1, :updated_at => DateTime.now})
      # product1 = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => true})
      # product2 = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => true})
      # expect(Purchase.where(:created_at => purchase.created_at..purchase.updated_at + 1)).to(eq([purchase]))
      expect(Purchase.sold_between(purchase.created_at, purchase.created_at + 1)).to(eq([purchase]))
    end
  end

  describe('.total_sales') do
    it('will return the total profits made between a date range') do
      purchase = Purchase.create()
      product1 = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => true})
      product2 = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => true})
      product3 = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase.id, :sold => true})
      purchase2 = Purchase.create({:created_at => DateTime.now - 1, :updated_at => DateTime.now})
      product4 = Product.create({:description => "lamp", :price => 50.5, :purchase_id => purchase2.id, :sold => true})
      expect(Purchase.total_sales(purchase.created_at, purchase.created_at + 1)).to(eq(151.5))
    end
  end
end
