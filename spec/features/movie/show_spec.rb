require 'rails_helper'

RSpec.describe 'movies show page' do
  describe 'user' do
    before (:each) do
      @studio1 = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')

      @godfather = @studio1.movies.create!(title: 'The Godfather', creation_year: 1972, genre: 'drama')
      @gun = @studio1.movies.create!(title: 'The Naked Gun', creation_year: 1988, genre: 'comedy')

      @al = Actor.create!(name: 'Al Pacino', age:81)
      @marlon = Actor.create!(name: 'Marlon Brando', age: 70)
      @diane = Actor.create!(name: 'Diane Keaton', age: 75)

      @godfather.actors << [@al, @marlon, @diane]
    end

    it 'displays movie title, year, and genre' do
      visit "/movies/#{@godfather.id}"

      expect(page).to have_content(@godfather.title)
      expect(page).to have_content(@godfather.creation_year)
      expect(page).to have_content(@godfather.genre)

      expect(page).to have_content("* #{@marlon.name}\n* #{@diane.name}\n* #{@al.name}")

      expect(page).to have_content('average age: 75.33')
    end

    it 'has a form to add a new actor' do
      visit "/movies/#{@godfather.id}"
      expect(page).to_not have_content('Robert De Niro')

      fill_in(:name, with: 'Robert De Niro')
      fill_in(:age, with: 77)

      click_button('Add Actor to Movie')

      expect(current_path).to eq("/movies/#{@godfather.id}")

      expect(page).to have_content('Robert De Niro')
    end
  end
end
