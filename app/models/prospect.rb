class Prospect < TuskerMarvelResource
  def next_package
    Package.all.detect{ |package| (package.contents & self.received).empty? }
  end
end
