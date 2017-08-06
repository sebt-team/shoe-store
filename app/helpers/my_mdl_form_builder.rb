class MyMdlFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(attribute, args)
    generic_field(attribute, args) do |attibute, args|
      super(attibute, args)
    end
  end

  def number_field(attribute, args)
    generic_field(attribute, args) do |attibute, args|
      super(attibute, args)
    end
  end
  
  def file_field(attribute, args)
    @template.content_tag(:div, { class: 'mdl-textfield mdl-js-textfield mdl-textfield--file' }) do
      @template.text_field_tag(:file, nil, {class: 'mdl-textfield__input', id: 'uploadFile', placeholder: 'Photo', readonly: true}) +
      @template.content_tag(:div, class: 'mdl-button mdl-button--primary mdl-button--icon mdl-button--file') do
        @template.content_tag(:i, 'attach_file',class: 'material-icons') + super(attribute,args.merge({id: 'uploadBtn'}))
      end
    end
  end
  
  private 
  def generic_field(attribute, args)
    field_wrapper do
      generic_label(attribute) +
      yield(attribute, args.merge({class: 'mdl-textfield__input'})) + span_error(attribute)
    end
  end

  def field_wrapper(&block)
    @template.content_tag(:div, { class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label' }) do
      block.call
    end
  end
  
  def file_field_wrapper
    @template.content_tag(:div, { class: 'mdl-textfield mdl-js-textfield mdl-textfield--file' }) do
      block.call
    end
  end
  

  
  
  def span_error(attribute)
    if @object.errors[attribute].present?
      @template.content_tag(:span, @object.errors[attribute.to_sym].join(", ").try(:capitalize), class: 'mdl-textfield__message-error ')      
    else
      ''
    end      
  end
    
  def generic_label(attribute)
    @template.content_tag("label", attribute.capitalize, for: "#{@object_name}_#{attribute}", class: "mdl-textfield__label")    
  end
  
end
