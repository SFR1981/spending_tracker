require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/merchant.rb')


also_reload('./models*')

get '/merchants' do
  @merchants = Merchant.all()
  erb( :"merchant/index" )
end

get '/merchants/new' do
  erb( :"merchant/new")
end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb( :"merchant/show" )
end
