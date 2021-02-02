require './lib/spaces' 

describe Spaces do 

    describe '.create' do 
        it 'Should create a new listing' do 
            listing = Spaces.create(name: 'first listing')
            expect(listing).to be_a Spaces
            expect(listing.name).to eq 'first listing'
        end 
    end 
end 