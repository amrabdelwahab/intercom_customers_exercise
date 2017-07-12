require './lib/models/location'
require './lib/repositories/customer'

office = Models::Location.new(-6.2576841, 53.3393)
customer_repo = Repositories::Customer.new
guest_list = customer_repo.within_range(office, 100).sort

guest_list.each do |customer|
  puts "#{customer.user_id} - #{customer.name}"
end
