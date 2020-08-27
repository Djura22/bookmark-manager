require 'pg'

feature 'viewing bookmarks'  do
  scenario 'shows saved bookmarks to user' do

  	Bookmarks.create(url: 'www.google.com', title: 'Google')
  	Bookmarks.create(url: 'www.facebook.com', title: 'Facebook')
  	Bookmarks.create(url: 'www.twitter.com', title: 'Myspace')

    visit ('/bookmarks')

    expect(page).to have_link('Google', href: 'www.google.com')
    expect(page).to have_link('Facebook',  href: 'www.facebook.com')
    expect(page).to have_link('Myspace', href: 'www.twitter.com')
    
  end
end