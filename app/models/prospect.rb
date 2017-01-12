class Prospect < ActiveResource::Base
  self.site = 'http://tuskermarvel.com/'
  self.user = 'username'
  self.password = 'tuskermarvel'

  def next_package
    Package.all.detect{ |package| (package.contents & self.received).empty? }
  end
end
