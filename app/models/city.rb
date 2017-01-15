class City
  attr_reader :name, :packages

  def initialize(name)
    @name = name
    @packages = Prospect.find_by_delivery_city(self.name).map(&:next_package)
  end

  def self.all
    Prospect.delivery_cities.map{ |name| self.new(name) }
  end

  def self.find_by_name(name)
    self.all.detect{ |city| city.name == name }
  end
end
