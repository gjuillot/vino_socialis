ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  unless html_tag =~ /^<label/
    %{<div class="alert alert-error">#{html_tag}<br />#{instance.error_message.first}</div>}.html_safe
  else
    %{#{html_tag}}.html_safe
  end
end