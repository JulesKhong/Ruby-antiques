class Purchase < ActiveRecord::Base
  has_many(:products)

  scope(:sold_between, -> (start_date, end_date) {
    where({:created_at => start_date..end_date})
  })

  define_singleton_method('total_sales') do |start_date, end_date|
    sales = self.sold_between(start_date, end_date)
    total = 0
    sales.first.products.each do | sale |
      total += sale.price
    end
    total
  end
end
