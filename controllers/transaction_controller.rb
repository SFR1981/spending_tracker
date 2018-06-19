require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/transaction.rb')
require_relative( '../models/merchant.rb')
require_relative( '../models/tag.rb')
also_reload('../models*')

get '/transactions' do
  @transactions = Transaction.all()
  #@total_spend = Transaction.total_spend()
  erb ( :"transaction/index" )
end



get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb( :"transaction/new")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save()
  erb( :"transaction/create" )
end

get '/transactions/:id' do
  @transaction = Transaction.find(params['id'].to_i)
  erb( :"transaction/show" )
end

#edit
get '/transactions/:id/edit' do
  @transaction = Transaction.find(params[:id].to_i)
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transaction/edit" )
end

#post
post '/transactions/:id' do
  @transaction = Transaction.new(params)
  @transaction.update()
  erb( :"transaction/update" )
end

#delete
post '/transactions/:id/delete' do
  @transaction = Transaction.find(params[:id].to_i)
  @transaction.delete
  redirect '/transactions' #form posting to delete route
end
