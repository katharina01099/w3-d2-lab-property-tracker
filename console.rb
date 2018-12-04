require('pry')
require_relative('models/property_tracker')

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

property1.save

property1.adress = "Princess Street"
property1.update

property1.delete 
