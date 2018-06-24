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
  @message = "Total money you'll never see again: #{Transaction.total_spend()}"
  erb( :"transaction/index" )
end


get '/transactions/oldest_first' do
  @transactions = Transaction.order_by_oldest()
  @message = "Total money gone forever: #{Transaction.total_spend()}"
  erb( :"transaction/index" )
end

get '/transactions/yesterday' do
  @transactions = Transaction.yesterday()
  @message = "Yesterday you were #{Transaction.yesterday_total()} richer"
  erb( :"transaction/index" )

end

get '/transactions/last_week' do
  @transactions = Transaction.last_week()
  @message = "Last week you racked up a spendtastic: #{Transaction.last_week_total()}"
  erb( :"transaction/index" )
end

get '/transactions/last_month' do
  @transactions = Transaction.last_month()
  @message = "Last month cost you #{Transaction.last_month_total}"
  erb ( :"transaction/index" )
end

get '/transactions/tags' do
  @tags = Tag.by_tag()
  erb ( :"transaction/tags")
end



get '/transactions/new' do
  @tags = Tag.all()
  @merchants = Merchant.all()
  erb( :"transaction/new")
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
  params['value'] = MoneyHandler.check_decimal(params['value'])
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
