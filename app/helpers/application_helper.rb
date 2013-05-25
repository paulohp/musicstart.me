module ApplicationHelper
  def avatar_url user
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def submit_form text, finder
    link_to_function text, "$('#{finder}').submit()"
  end

  def cancel_form text, local
    link_to_function text, "window.redirect = #{local}"
  end
end
