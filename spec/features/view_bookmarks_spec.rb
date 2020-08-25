feature 'viewing bookmarks'  do
  scenario 'shows saved bookmarks to user' do
    visit ('/bookmarks')
    expect(page).to have_content 'Your bookmarks:'
  end
end