class Prospect < ActiveResource::Base
  self.site = 'http://tuskermarvel.com/'

  def next_package
    Package.all.detect{ |package| (package.contents & self.received).empty? }
  end
end
