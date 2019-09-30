require('sinatra')
require('sinatra/reloader')
require_relative('./models/category.rb')
require_relative('./models/merchant.rb')
require_relative('./models/transaction.rb')
require_relative('./models/user.rb')
also_reload('../models/*')

get '/' do
  erb(:index)
end

#TRANSACTIONS

get '/transactions' do
  @transactions = Transaction.all
  erb(:"transactions/index")
end

# get '/transactions/index' do
#   @transaction = Transaction.all
#   erb(:"transactions/index")
# end

get '/transactions/new' do
  @transaction = Transaction.all
  erb(:"transactions/new")
end

get '/transactions/index/:id' do
  @transaction = Transaction.find(params[:id])
  erb(:"transactions/index")
end

post '/transactions/index' do
  Transaction.new(params).save
  redirect'/transactions/index'
end

#MERCHANTS

get '/merchants' do
  @merchant = Merchant.all
  erb(:merchants)
end

get '/merchants/index' do
  @merchant = Merchant.all
  erb(:"/merchants/index")
end

get '/merchants/new' do
  @merchant = Merchant.all
  erb(:"/merchants/new")
end

get '/merchants/:id' do
  @merchant = Merchant.read(params[:id])
  erb(:"/merchants/index")
end

post '/merchants' do
  Merchant.new(params).save
  redirect'/merchants'
end

#CATEGORIES

get '/categories' do
  @category = Category.all
  erb(:categories)
end

get '/categories/index' do
  @category = Category.all
  erb(:"/categories/index")
end