class Prospect < TuskerMarvelResource
  def self.find_by_contact(contact)
    Prospect.all.detect{ |prospect| prospect.contact == contact }
  end

  def available_packages
    Package.all.select{ |package| !contents_received?(package) }
  end

  def next_package
    Package.all.detect{ |package| !contents_received?(package) }
  end

  private

  def contents_received?(package)
    (package.contents & self.received).present?
  end
end
