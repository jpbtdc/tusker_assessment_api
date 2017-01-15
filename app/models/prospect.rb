class Prospect < TuskerMarvelResource
  def self.find_by_contact(contact)
    self.all.detect{ |prospect| prospect.contact == contact }
  end

  def available_packages
    Package.find_by_missing_contents(self.received)
  end

  def next_package
    Package.find_by_missing_contents(self.received).first
  end
end
