module ApplicationHelper
  def avatar_url user
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  def submit_form text, finder
    link_to_function text, "$('#{finder}').submit()"
  end

  def link_to_submit text, args
    link_to_function text, "$(this).closest('form').submit()", args
  end

  def cancel_form text, local
    link_to_function text, "window.redirect = #{local}"
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end

    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end
end
