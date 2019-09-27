require_relative('models/merchant')
require_relative('models/transaction')
require_relative('models/category')
require_relative('models/user')

require('pry')

user1 = User.new({'user_name' => 'Ben Wyatt', 'funds' => 2000})
user1.save
