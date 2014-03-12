class Wizard
  attr_reader :url, :description, :title

  def initialize(title,description,url)
    regex = /^http:\/\/\S+.\S+$/
    if url =~ regex
      @url = url
    else
      raise "Url provided is not valid. Must start with http://"
    end

    @title = title
    @description = description
  end

end
