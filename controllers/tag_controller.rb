require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/tag.rb')
require_relative( './emojis.rb')

also_reload('./models*')



get '/tags' do
  @tags = Tag.all()
  erb( :"tag/index" )
end

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  erb( :"tag/show" )
end


get '/tags/new' do

 end



# post '/tags' do
#   @tag = Tag.new(params)
#   @tag.save()
#   erb ( :"tag/create" )
# end
