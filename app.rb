# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmarks'

class BookmarkManager < Sinatra::Base


  get '/' do
    erb :index
  end

  get '/bookmarks' do
    @BM = Bookmark.all
    erb :bookmarks
  end

  get '/bookmarks/new' do
  	erb :"bookmarks/new"
  end

  post '/bookmarks' do
  	Bookmarks.create(url: params[:url])
  	redirect '/bookmarks'
  end


  run! if app_file == $0  
end
