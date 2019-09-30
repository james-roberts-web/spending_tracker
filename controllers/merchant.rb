require('sinatra')
require('sinatra/reloader')
require_relative('../models/category.rb')
require_relative('../models/merchant.rb')
require_relative('../models/transation.rb')
require_relative('../models/user.rb')
also_reload('../models/*')

get '/merchants' do
  @merchants = Merchant.all
  erb(:"merchants/index")
end

get '/merchants/new' do
  @merchants = Merchant.all
  erb(:"/merchants/new")
end

post '/merchants' do
  Merchant.new(params).save
  redirect'/merchants'
end

get '/merchants/:id' do
  @merchants = Merchant.find(params[:id])
  erb(:"/merchants/index")
end

get '/merchants/:id/edit' do
  @merchants = Merchant.find(params[:id])
  erb(:"/merchants/edit")
end

put '/merchants/:id' do
  Merchant.new(params).update
  redirect '/merchants'
end

delete '/merchants/:id' do
  destructed = Merchant.find(params[:id])
  destructed.delete
  redirect '/merchants'
end
