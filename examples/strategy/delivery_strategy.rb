Dir.glob(
  File.expand_path("./delivery_strategy/*.rb", File.dirname(__FILE__))
).each do |file|
  require file
end

class DeliveryStrategy
  attr_reader :cost, :distance

  def initialize(place, company)
    calculate_distance(place)
    seek_cost(distance, company)
  end

  def calculate_distance(place)
    @distance = '500 km'
  end

  def seek_cost(distance, company)
    company_class = eval(company.split('_').map{|w| w.capitalize}.join)
    @cost = company_class.new(distance).cost
  end
end