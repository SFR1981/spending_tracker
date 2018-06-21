require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/transaction.rb')
require_relative( '../models/merchant.rb')
require_relative( '../models/tag.rb')
require_relative( '../models/money_handler.rb')
also_reload('../models*')

get '/transactions' do
  @transactions = Transaction.order_by_newest()
  erb( :"transaction/index" )
end


get '/transactions/oldest_first' do
  @transactions = Transaction.order_by_oldest()
  erb( :"transaction/oldest_first" )
end

get '/transactions/yesterday' do
  @transactions = Transaction.yesterday()
  erb( :"transaction/yesterday" )

end

get '/transactions/last_week' do
  @transactions = Transaction.last_week()
  erb( :"transaction/last_week" )
end

get '/transactions/last_month' do
  @transactions = Transaction.last_month()
  erb ( :"transaction/last_month" )
end

get '/transactions/tags' do
  @tags = Tag.by_tag()
  @transactions = 

  erb ( :"transaction/tags")
end



get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb( :"transaction/new")
end

get 'transactions/quick' do
  @merchant = Merchant.find_name('Quick Adds')
  erb (:"transaction/quick")
end


post '/transactions' do
  params['value'] = MoneyHandler.check_decimal(params['value'])
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
  redirect '/transactions'
end
