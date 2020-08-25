# frozen_string_literal: true

feature 'testing tests' do
  scenario 'returns Hello World on homepage' do
    visit('/')
    expect(page).to have_content 'Welcome to Bookmark Manager!'
  end
end
