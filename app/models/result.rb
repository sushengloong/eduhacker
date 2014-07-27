class Result
  attr_reader :content, :remote_link, :thumbnail_link

  def initialize content, remote_link, thumbnail_link
    @content, @remote_link, @thumbnail_link = content, remote_link, thumbnail_link
  end
end
