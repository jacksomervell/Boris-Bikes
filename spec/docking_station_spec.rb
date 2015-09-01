require_relative '../lib/docking.rb'
require_relative '../lib/bike.rb'
require_relative './spec_helper.rb'

describe DockingStation do

  def fill_station station
    20.times {station.dock(Bike.new)}
  end 

  let (:station) { DockingStation.new ({capacity: 20}) }
  let (:bike) {Bike.new}

  it 'should be empty after we build it' do
    expect(station.bike_count).to eq 0
  end 

  it 'is able to dock a bike' do
    station.dock(bike)

    expect(station.bike_count).to eq 1

  end

  it 'is able to release a bike' do
    station.dock(bike)
    station.release(bike)

    expect(station.bike_count).to eq 0

  end

  it 'should know when it has reached capacity' do
    fill_station station
    
    expect(station.full?).to be true    
  end 

  it 'should not accept bike if its full' do
    fill_station station
    expect {station.dock(bike)}.to raise_error RuntimeError 
  end 

  it 'should provide a list of available bikes' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)

    puts station.available_bikes.inspect

    expect(station.available_bikes).to eq  [working_bike]
  end 

end