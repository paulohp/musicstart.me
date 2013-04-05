module ProjectsHelper
  def submit_form text, finder
    link_to_function text, "$('finder').submit()"
  end
end
