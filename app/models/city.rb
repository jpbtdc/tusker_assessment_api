class City
  attr_reader :name, :packages

  def initialize(name)
    @name = name
    @packages = Prospect.all.select{ |prospect| prospect.delivery_city == self.name }.map(&:next_package)
  end

  def self.all
    Prospect.all.map(&:delivery_city).uniq.map{ |name| City.new(name) }
  end

  def self.find_by_name(name)
    City.all.detect{ |city| city.name == name }
  end
end
