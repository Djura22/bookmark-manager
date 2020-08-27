require './lib/bookmarks.rb'
require 'database_helpers'

describe Bookmarks do

  describe '.all' do 
    it 'displays a list of bookmarks' do

      connection = PG.connect(dbname: 'bookmark_manager_test')
  
   	  bookmark = Bookmarks.create(url: 'www.bookmark.test', title: 'Bookmark')
   	  Bookmarks.create(url: 'www.facebook.com', title: 'Facebook')
   	  Bookmarks.create(url: 'www.twitter.com', title: 'Twitter')
  
      bookmarks = Bookmarks.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Bookmark'
      expect(bookmarks.first.url).to eq 'www.bookmark.test'
    end
  end

  describe '.create' do
  	it 'creates a new bookmark' do
  		bookmark = Bookmarks.create(url: 'www.bookmark.test', title: 'Bookmark')
  		persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq persisted_data.first['id']
  		expect(bookmark.url).to eq 'www.bookmark.test'
  		expect(bookmark.title).to eq 'Bookmark'
  	end
  end

end