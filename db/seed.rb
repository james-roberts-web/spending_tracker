require_relative('../models/merchant')
require_relative('../models/transaction')
require_relative('../models/category')
require_relative('../models/user')

require('pry')

user1 = User.new({'user_name' => 'Ben Wyatt', 'funds' => 2000})
user1.save

merchant1 = Merchant.new({'merchant_name' => 'Tesco'})
merchant1.save

merchant2 = Merchant.new({'merchant_name' => 'Netflix'})
merchant2.save

merchant3 = Merchant.new({'merchant_name' => 'Amazon'})
merchant3.save

merchant4 = Merchant.new({'merchant_name' => 'Perk'})
merchant4.save

merchant5 = Merchant.new({'merchant_name' => 'Velocity'})
merchant5.save

merchant6 = Merchant.new({'merchant_name' => 'Apple'})
merchant6.save

merchant7 = Merchant.new({'merchant_name' => 'Bank of Scotland'})
merchant7.save

#CATEGORIES

category1 = Category.new({'transaction_type' => 'Groceries'})
category1.save

category2 = Category.new({'transaction_type' => 'Entertainment'})
category2.save

category3 = Category.new({'transaction_type' => 'Travel'})
category3.save

category4 = Category.new({'transaction_type' => 'Food and Drink'})
category4.save

category5 = Category.new({'transaction_type' => 'Utilities'})
category5.save

category6 = Category.new({'transaction_type' => 'Fuel'})
category6.save

category7 = Category.new({'transaction_type' => 'Mortgage'})
category7.save

#TRANSACTIONS

transaction1 = Transaction.new({
  'user_id' => 1,
  'merchant_id' => 1,
  'category_id' => 1,
  'transaction_date' => ('2019-09-29'),
  'amount' => 599
  })
transaction1.save

transaction2 = Transaction.new({
  'user_id' => 1,
  'merchant_id' => 4,
  'category_id' => 3,
  'transaction_date' => ('2019-09-29'),
  'amount' => 699
  })
transaction2.save

transaction3 = Transaction.new({
  'user_id' => 1,
  'merchant_id' => 2,
  'category_id' => 6,
  'transaction_date' => ('2019-09-29'),
  'amount' => 250
  })
transaction3.save

transaction4 = Transaction.new({
  'user_id' => 1,
  'merchant_id' => 6,
  'category_id' => 2,
  'transaction_date' => ('2019-09-29'),
  'amount' => 400
  })
transaction4.save

binding.pry
