class Package < TuskerMarvelResource
  def self.find_by_missing_contents(contents)
    self.all.select{ |package| !package.includes_contents?(contents) }
  end

  def includes_contents?(contents)
    (self.contents & contents).present?
  end
end
