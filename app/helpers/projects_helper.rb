module ProjectsHelper
  def submit_form text, finder
    link_to_function text, "$('finder').submit()"
  end

  def picture_url
    @project.image_url_url
  end

  def thumb_url
    @project.project.thumb.url
  end

  def has_picture?
    @project.image_url?
  end

end
