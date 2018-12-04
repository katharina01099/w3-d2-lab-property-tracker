require('pry')
require_relative('models/property_tracker')

PropertyTrack.delete_all

property1 = PropertyTrack.new({
  #:adress, :value, :no_bedrooms, :year, :square_footage, :build
  'adress' => 'Castle Walk 3',
  'value' => '200',
  'no_bedrooms' => '3',
  'year' => '1900',
  'square_footage' => '30',
  'build' => 'cottage'
}
)


property2 = PropertyTrack.new({
  #:adress, :value, :no_bedrooms, :year, :square_footage, :build
  'adress' => 'Highstreet',
  'value' => '100',
  'no_bedrooms' => '2',
  'year' => '1950',
  'square_footage' => '60',
  'build' => 'flat'
}
)


property1.save

#property1.adress = "Princess Street"
#property1.update

#property1.delete

property2.save

fondPr = PropertyTrack.find(30)
p fondPr
