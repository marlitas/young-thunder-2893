require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many :roles}
    it {should have_many(:actors).through(:roles)}
  end
  describe 'instance methods' do
    it 'can calculate average age of actors' do
      studio1 = Studio.create!(name: 'Paramount Pictures', location: 'Hollywood')

      godfather = studio1.movies.create!(title: 'The Godfather', creation_year: 1972, genre: 'drama')

      al = Actor.create!(name: 'Al Pacino', age:81)
      marlon = Actor.create!(name: 'Marlon Brando', age: 70)
      diane = Actor.create!(name: 'Diane Keaton', age: 75)

      godfather.actors << [al, marlon, diane]

      expect(godfather.average_age).to eq(75.33)
    end
  end
end
