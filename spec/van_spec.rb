require_relative './spec_helper.rb'


describe Van do

  def fill_van van
    15.times {van.load(Bike.new)}
  end 

let (:van) {Van.new}
let (:bike) {Bike.new}

  it 'should be empty after we build it' do
    expect(van.bike_count).to eq 0
  end 
  
   it 'is able to load a bike' do
    van.load(bike)
    expect(van.bike_count).to eq 1
  end

  it 'is able to unload a bike' do
    van.load(bike)
    van.unload(bike)
    expect(van.bike_count).to eq 0
  end

it 'should know when it has reached capacity' do
    fill_van van
    expect(van.full?).to be true    
  end 

  it 'should not accept bike if its full' do
    fill_station station
    expect {station.dock(bike)}.to raise_error RuntimeError 
  end 



end