require 'pg'

feature 'viewing bookmarks'  do
  scenario 'shows saved bookmarks to user' do

  	connection = PG.connect(dbname: 'bookmark_manager_test')

  	connection.exec("INSERT INTO bookmarks VALUES (1, 'www.google.com');")
  	connection.exec("INSERT INTO bookmarks VALUES (2, 'www.facebook.com');")
  	connection.exec("INSERT INTO bookmarks VALUES (3, 'www.twitter.com');")

    visit ('/bookmarks')

    expect(page).to have_content 'www.google.com'
    expect(page).to have_content 'www.facebook.com'
    expect(page).to have_content 'www.twitter.com'
  end
end