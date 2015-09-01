require_relative './spec_helper.rb'


describe Van do

  def fill_van van
    15.times {van.load(Bike.new)}
  end 

let (:van) {Van.new({capacity: 15})}
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
    fill_van van
    expect {van.load(bike)}.to raise_error RuntimeError 
  end 

it 'should only accept broken bikes' do
  working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break

     van.load(working_bike)
    van.load(broken_bike)

    expect(van.accepted_bikes).to eq  [broken_bike]
  end 

end