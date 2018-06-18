require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/transaction.rb')
also_reload('../models*')

get '/transactions' do
  @transactions = Transaction.all()
  erb ( :"transaction/index" )
end
