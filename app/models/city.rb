class City
  attr_reader :name, :packages

  def initialize(name)
    @name = name
    @packages = Prospect.all.select{ |prospect| prospect.delivery_city == self.name }.map(&:next_package)
  end

  def self.all
    Prospect.all.map(&:delivery_city).uniq.map{ |name| City.new(name) }
  end
end
