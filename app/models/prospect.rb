class Prospect < TuskerMarvelResource
  def self.find_by_contact(contact)
    self.all.detect{ |prospect| prospect.contact == contact }
  end

  def self.find_by_delivery_city(delivery_city)
    self.all.select{ |prospect| prospect.delivery_city == delivery_city }
  end

  def self.delivery_cities
    self.all.map(&:delivery_city).uniq
  end

  def available_packages
    Package.find_by_missing_contents(self.received)
  end

  def next_package
    Package.find_by_missing_contents(self.received).first
  end
end
