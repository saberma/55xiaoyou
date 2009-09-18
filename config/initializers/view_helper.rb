module ActionView::Helpers::FormHelper
  def label_with_model(object_name, method, text = nil, options = {})
    text ||= t("activerecord.attributes.#{object_name}.#{method}", :default => "")
    text += content_tag(:span, "*", :class => "required") if options[:require]
    label_without_model object_name, method, text, options
  end
  #直接根据method获取cn.yml中定义的文本
  #如f.label :phone,返回内容为"联系电话"的label,f为case的form
  alias_method_chain :label, :model

  def radio_button_with_class(object_name, method, text = nil, options = {})
    options.merge! :class => :radio
    radio_button_without_class object_name, method, text, options
  end
  #为radio加上默认的class:radio
  alias_method_chain :radio_button, :class
end

class ActionView::Helpers::FormBuilder
  #必填项,即标记后加"*"
  def label_require(method, text = nil, options = {})
    options[:require] = true
    label(method, text, options)
  end
end
