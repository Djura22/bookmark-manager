require 'pg'

feature 'adding bookmarks'  do
  scenario 'adds a bookmark to the database' do

  	visit('/bookmarks/new')

    fill_in('url', with: 'www.bookmark.test')
    fill_in('title', with: 'Bookmark')
    click_button('Submit')

    expect(page).to have_link('Bookmark', href: 'www.bookmark.test')

  end
end