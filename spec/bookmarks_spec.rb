require './lib/bookmarks.rb'

describe Bookmarks do

  describe '.all' do 
    it 'displays a list of urls' do

  	  Bookmarks.create(url: 'www.google.com')
  	  Bookmarks.create(url: 'www.facebook.com')
  	  Bookmarks.create(url: 'www.twitter.com')

      bookmarks = Bookmarks.all

      expect(bookmarks).to include('www.google.com', 'www.facebook.com', 'www.twitter.com')
    end
  end

  describe '.create' do
  	it 'creates a new bookmark' do
  		Bookmarks.create(url: 'www.bookmark.test')

  		expect(Bookmarks.all).to include 'www.bookmark.test'
  	end
  end

end