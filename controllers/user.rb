require('sinatra')
require('sinatra/reloader')
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transation.rb')
require_relative('../models/user.rb')
also_reload('../models/*')

get '/users' do
  @user = User.all()
  erb ( :"users/index" )
end

get '/users/:id' do
  @user = User.find(params['id'].to_i)

end
