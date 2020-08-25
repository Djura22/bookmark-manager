require './lib/bookmarks.rb'

describe '#bookmarks' do
  it 'displays a list of urls' do
    bookmark = Bookmark.all
    expect(bookmark).to include('www.google.com','www.facebook.com', 'www.twitter.com')
  end
end