# As a user
# When I visit and Artist's Songs index
# Then I see the titles all of that Artist's Songs
# And I see that each title is a link to the songs show page

require 'rails_helper'

RSpec.describe 'Artists songs index' do
    it 'shows all of the titles of the songs for the artist' do
        prince = Artist.create!(name: 'Prince')
        purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)

        visit "/artists/#{prince.id}/songs"

        expect(page).to have_content(purple.title)
        expect(page).to have_content(beret.title)
    end
    
    it 'links to each songs show page' do
        prince = Artist.create!(name: 'Prince')
        purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
        beret = prince.songs.create!(title: 'Raspberry Beret', length: 665, play_count: 99)

        visit "/artists/#{prince.id}/songs"
        
        click_on purple.title

        expect(current_path).to eq("/songs/#{purple.id}")
    end
end