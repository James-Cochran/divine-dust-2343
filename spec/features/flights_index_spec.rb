require 'rails_helper'

RSpec.describe "Flights Index Page" do
  before(:each) do
    @airline = Airline.create!(name: "Speedy")

    @flight1 = Flight.create!(number: "0001", date: "01/02/03", departure_city: "Miami", arrival_city: "Dallas", airline: @airline)
    @flight2 = Flight.create!(number: "0002", date: "04/05/06", departure_city: "Cheyenne", arrival_city: "Seattle", airline: @airline)

    @passenger1 = Passenger.create!(name: "Fred", age: 25)
    @passenger2 = Passenger.create!(name: "Frank", age: 30)

  @flight1.passengers << @passenger1
  @flight2.passengers << @passenger2     
  end
  
  # User Story 1
  it "shows a list of all flight numbers" do
    visit "/flights"
  
    expect(page).to have_content(@flight1.number)
    expect(page).to have_content(@flight2.number)

  end

  it "shows the airline name next to the flight number" do
    visit "/flights"
    
    expect(page).to have_content("Flight Number: #{@flight1.number} - Airline: #{@airline.name}")
    expect(page).to have_content("Flight Number: #{@flight2.number} - Airline: #{@airline.name}")

  end

  it "shows the names of a flights passengers under the flight number" do
    visit "/flights"
    save_and_open_page
    expect(page).to have_content("Flight Number: #{@flight1.number} - Airline: #{@airline.name}")
    expect(page).to have_content(@passenger1.name)
    
    expect(page).to have_content("Flight Number: #{@flight2.number} - Airline: #{@airline.name}")
    expect(page).to have_content(@passenger2.name)

  end
end