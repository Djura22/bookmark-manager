require 'pg'

feature 'viewing bookmarks'  do
  scenario 'shows saved bookmarks to user' do

  	Bookmarks.create(url: 'www.google.com' )
  	Bookmarks.create(url: 'www.facebook.com' )
  	Bookmarks.create(url: 'www.twitter.com' )

    visit ('/bookmarks')

    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.facebook.com'
    expect(page).to have_content 'www.twitter.com'
  end
end