require './lib/bookmarks.rb'

describe Bookmarks do

  describe '.all' do 
    it 'displays a list of urls' do
  	  connection = PG.connect(dbname: 'bookmark_manager_test')

  	  connection.exec("INSERT INTO bookmarks VALUES(1, 'www.google.com');")
  	  connection.exec("INSERT INTO bookmarks VALUES(2, 'www.facebook.com');")
  	  connection.exec("INSERT INTO bookmarks VALUES(3, 'www.twitter.com');")

      bookmarks = Bookmarks.all

      expect(bookmarks).to include('www.google.com', 'www.facebook.com', 'www.twitter.com')
    end
  end

end