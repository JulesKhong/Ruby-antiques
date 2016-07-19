class Purchase < ActiveRecord::Base
  has_many(:products)

  scope(:sold_between, -> (start_date, end_date) {
    where({:created_at => start_date..end_date})
  })
  define_singleton_method('total_sales') do |all_sales|
    total = 0
    all_sales.each do | sale |
      total += Product.where(:purchase_id => sale.id).sum(:price)
    end
    total
  end
end

# all_sales = Purchase.where(:created_at => purchase.created_at..purchase.updated_at + 1)
