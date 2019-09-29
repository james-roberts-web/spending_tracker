require_relative('models/merchant')
require_relative('models/transaction')
require_relative('models/category')
require_relative('models/user')

require('pry')

user1 = User.new({'user_name' => 'Ben Wyatt', 'funds' => 2000})
user1.save

merchant1 = Merchant.new({'merchant_name' => 'Tesco'})
merchant1.save

category1 = Category.new({'transaction_type' => 'Groceries'})
category1.save
