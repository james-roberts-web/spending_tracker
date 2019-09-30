require('sinatra')
require('sinatra/reloader')
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transation.rb')
require_relative('../models/user.rb')
also_reload('../models/*')

get '/transactions' do
  @transaction = Transaction.all
  @category = Category.all
  @merchant = Merchant.all
  @user = User.all
  erb(:transactions_index)
end
