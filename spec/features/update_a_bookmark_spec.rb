feature 'updating an existing bookmark' do 

	scenario 'A user can update a bookmark' do
		bookmark = Bookmarks.create(url: 'www.google.com', title: 'Google')
		visit('/bookmarks')
		expect(page).to have_link('Google', href: 'www.google.com')

		first('.bookmark').click_button "Edit"
		expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

		fill_in('url', with: 'www.googly.com')
		fill_in('title', with: 'Googly')
		click_button('Submit')

		expect(current_path).to eq '/bookmarks'
		expect(page).not_to have_link('Google', href: 'www.google.com')
		expect(page).to have_link('Googly', href: 'www.googly.com')
	end
end
