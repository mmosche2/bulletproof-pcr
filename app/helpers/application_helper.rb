module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end


  def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_fields", product_form: builder)
    end
    link_to(name, '#', class: "add_fields", data: {id: id, fields: fields.gsub("\n", "")})
  end

  def complaint_sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == complaint_sort_column) ? "current #{complaint_sort_direction}" : nil
    direction = (column == complaint_sort_column && complaint_sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:complaint_sort => column, :complaint_direction => direction, :complaint_page => nil), {:class => css_class}
  end

  def return_sortable(column, title = nil)
    title ||= column.titleize
    css_class = (column == return_sort_column) ? "current #{return_sort_direction}" : nil
    direction = (column == return_sort_column && return_sort_direction == "asc") ? "desc" : "asc"
    link_to title, params.merge(:return_sort => column, :return_direction => direction, :return_page => nil), {:class => css_class}
  end

  def wicked_pdf_image_tag_for_public(img, options={})
    if img[0] == "/"
      new_image = img.slice(1..-1)
      image_tag "file://#{Rails.root.join('public', new_image)}", options
    else
      image_tag "file://#{Rails.root.join('public', 'images', img)}", options
    end
  end


end
