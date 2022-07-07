require 'rails_helper'

RSpec.describe Artist do
    describe 'relationships' do
        it {should have_many :songs}
    end

    describe'instance methods' do
        describe '#average_song_length' do
            it 'returns the average song length' do
                prince = Artist.create!(name: 'Prince')
                purple = prince.songs.create!(title: 'Purple Rain', length: 845, play_count: 8599)
                beret = prince.songs.create!(title: 'Raspberry Beret', length: 664, play_count: 99)
                song_test = prince.songs.create!(title: 'Test', length: 1, play_count: 99)
                
                expect(prince.average_song_length.round(2)).to eq(503.33)
            end
        end
    end
    
end