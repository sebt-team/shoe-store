module ApplicationHelper
  def attribute_shoe(letter, attribute, value, color = 'purple')
    content_tag(:span, class: 'mdl-chip mdl-chip--contact') do
      content_tag(:span, letter, class: "mdl-chip__contact mdl-color--#{color} mdl-color-text--white") +
      content_tag(:span,  class: 'mdl-chip__text') do
        content_tag(:strong, attribute.to_s.capitalize + ': ' ) + value.to_s
      end
    end
  end
end
