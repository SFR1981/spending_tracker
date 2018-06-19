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
  @tag = Tag.find(params['id'].to_i)
  erb( :"tag/show" )
end

#edit
get '/transactions/:id/edit' do
  @tag = Tag.find(params[:id].to_i)
  erb ( :"tag/edit" )
end

#post
post '/transactions/:id' do
  @tag = Tag.new(params)
  @tag.update()
  erb( :"tag/update" )
end

#delete
post '/transactions/:id/delete' do
  @tag = Tag.find(params[:id].to_i)
  @tag.delete
  redirect '/tags' #form posting to delete route
end
