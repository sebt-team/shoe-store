class MyMdlFormBuilder < ActionView::Helpers::FormBuilder

  def select_belongs_to(model, belongs_to_model, option_field)
    belongs_to_model = belongs_to_model.to_s
    field_wrapper do 
      @template.content_tag(:p, belongs_to_model.capitalize, for: "#{@object_name}_#{belongs_to_model}_id", class: "mdl-select__label") +
      @template.collection_select(model, "#{belongs_to_model}_id", belongs_to_model.classify.constantize.all, :id, option_field, {prompt: false})      
    end
  rescue
    nil
  end

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
  
  def select_wrapper(&block)
    @template.content_tag(:div, { class: 'mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fullwidth' }) do
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
    @template.content_tag(:label, attribute.capitalize, for: "#{@object_name}_#{attribute}", class: "mdl-textfield__label")    
  end
  
end
