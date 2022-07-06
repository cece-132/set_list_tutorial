require 'rails_helper'

RSpec.describe 'the songs show page' do
    it 'displays the song title' do
        artist = Artist.create(name: 'Carly Rae Jepsen')
        song = Song.create(title: "I Really Like You", length: 208, play_count: 2456357)
        visit "/songs/#{song.id}"
    end

    it 'displays the name of the artist for the song'
end