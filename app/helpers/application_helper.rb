module ApplicationHelper
  def alert_class_for(flash_type)
    {
      :success => 'alert-success',
      :error => 'alert-danger',
      :alert => 'alert-warning',
      :notice => 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    id = new_object.object_id
    fields = f.simple_fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to(name, '#', class: 'add_fields', data: { id: id, fields: fields.gsub("\n", "")})
  end

  def css (controller)
    if controller == 'projects'
      content_for(:head) { stylesheet_link_tag('bootstrap.css') }
    else
      content_for(:head) { stylesheet_link_tag 'skeleton.css' }
    end
  end
end
