require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/merchant.rb')
also_reload('../models*')

get '/merchants' do
  @merchants = Merchant.all()
  erb( :"merchant/index" )
end

get '/merchants/new' do
@logos = Dir["../public/images/logos/*"]
  erb( :"merchant/new")
end


post '/merchants' do
  @merchant = Merchant.new(params)
  @merchant.save()
  erb( :"merchant/create" )

end

post '/merchants/image' do
  tempfile = params['file'][:tempfile]
  filename = params['file'][:filename]
  File.copy(tempfile, "/images/logos/#{filename}")
  redirect back

end

get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb( :"merchant/show" )
end

get '/merchants/:id/edit' do
  @merchant = Merchant.find(params[:id].to_i)
  erb ( :"merchant/edit" )

end
#update
post '/merchants/:id/' do
  @merchant = Merchant.new(params)
  @merchant.update()
  erb( :"merchant/update" )
end
#delete

post '/merchants/:id/delete' do
  @merchant = Merchant.find(params[:id].to_i)
  @merchant.delete
  redirect '/merchants' #form posting to delete route
end
