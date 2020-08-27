require 'pg'

feature 'adding bookmarks'  do
  scenario 'adds a bookmark to the database' do

  	visit('/bookmarks/new')

    fill_in('url', with: 'www.bookmark.test')
    click_button('Submit')

    expect(page).to have_content 'www.bookmark.test'

  end
end