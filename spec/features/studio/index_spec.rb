require 'rails_helper'

RSpec.describe 'studio index' do
  describe 'user' do
    before(:each) do
      @studio1 = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')
      @studio2 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')

      @potter = @studio2.movies.create!(title: 'Harry Potter', creation_year: 2005, genre: 'fantasy')
      @raiders = @studio2.movies.create!(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'adventure')

      @godfather = @studio1.movies.create!(title: 'The Godfather', creation_year: 1972, genre: 'drama')
      @gun = @studio1.movies.create!(title: 'The Naked Gun', creation_year: 1988, genre: 'comedy')

    end
    it 'displays each studio name and location' do
      visit '/studios'

      expect(page).to have_content('Paramount Pictures')
      expect(page).to have_content('Universal Studios')
      expect(page).to have_content('Hollywood')

      within(:css, "##{@studio1.id}") do
        expect(page).to have_content(@godfather.title)
        expect(page).to have_content(@gun.title)
      end

      within(:css, "##{@studio2.id}") do
        expect(page).to have_content(@potter.title)
        expect(page).to have_content(@raiders.title)
      end
    end
  end
end
