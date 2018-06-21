require( 'sinatra' )
require( 'sinatra/contrib/all')
require( 'pry-byebug')
require_relative( '../models/tag.rb')
also_reload('../models*')

get '/tags' do
  @tags = Tag.all()
  erb( :"tag/index" )
end

get '/tags/new' do
  erb( :"tag/new")
end

post '/tags' do
  @tag = Tag.new(params)
  @tag.save()
  erb( :"tag/create" )
end

get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  @total_spend = @tag.total_spend()
  @transactions = @tag.transactions()
  erb( :"tag/show" )
end

#edit
get '/tags/:id/edit' do
  @tag = Tag.find(params[:id].to_i)
  erb ( :"tag/edit" )
end

#post
post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update()
  erb( :"tag/update" )
end

#delete
post '/tags/:id/delete' do
  @tag = Tag.find(params[:id].to_i)
  @tag.safe_delete
  redirect '/tags' 
end
