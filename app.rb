# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base

	enable :sessions, :method_override


  get '/' do
    'Welcome to Bookmark Manager!'
  end

  get '/bookmarks' do
    @BM = Bookmarks.all
    erb :index
  end

  get '/bookmarks/new' do
  	erb :"bookmarks/new"
  end

  get '/bookmarks/:id/edit' do 
  	@bookmark = Bookmarks.find(id: params[:id])
  	erb :"bookmarks/edit"
  end

  patch '/bookmarks/:id' do
  	Bookmarks.update(id: params[:id], url: params[:url], title: params[:title])
  	redirect('/bookmarks')
  end

  post '/bookmarks' do
  	Bookmarks.create(url: params[:url], title: params[:title])
  	redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
  	Bookmarks.delete(id: params[:id])
  	redirect '/bookmarks'
  end


  run! if app_file == $0  
end
