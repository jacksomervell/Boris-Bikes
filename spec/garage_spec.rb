require_relative './spec_helper.rb'

describe Garage do

def fill_garage garage
    200.times {garage.accept(Bike.new)}
  end 

  let (:garage) { Garage.new ({capacity: 200}) }
  let (:bike) {Bike.new}

  it 'should be empty after we build it' do
    expect(garage.bike_count).to eq 0
  end 

  it 'is able to accept a bike' do
    garage.accept(bike)

    expect(garage.bike_count).to eq 1

  end

  it 'is able to release a bike' do
    garage.accept(bike)
    garage.release(bike)

    expect(garage.bike_count).to eq 0

  end

  it 'should know when it has reached capacity' do
    fill_garage garage
    
    expect(garage.full?).to be true    
  end 

  it 'should not accept bike if its full' do
    fill_garage garage
    expect {garage.accept(bike)}.to raise_error RuntimeError 
  end 

it 'should only accept broken bikes' do
  working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break

     garage.accept(working_bike)
      garage.accept(broken_bike)

    expect(garage.accepted_bikes).to eq  [broken_bike]
  end 

  #should be bale to fix broken bikes
  #should only be able to release fixed bikes
end  