require "action_view"

module PartialForm
  class Builder < ActionView::Helpers::FormBuilder
    def initialize(*)
      super
      # CAUTION
      # we want to make sure that fields are not wrapped by a "field_with_errors" proc
      # this change affects all builders working on the current template
      @template.field_error_proc = proc { |html_tag, instance| html_tag }
    end

    def _label(method, text = nil, options = {}, &block)
      errors = object.errors.messages_for(method)
      render_partial("label", {f: self, method:, text:, errors:, options:, block:})
    end

    def _text_field(method, options = {}) = render_field("text_field", method, options)

    def _email_field(method, options = {}) = render_field("email_field", method, options)

    def _date_field(method, options = {}) = render_field("date_field", method, options)

    def _datetime_field(method, options = {}) = render_field("datetime_field", method, options)

    def _submit(value = nil, options = {})
      render_partial("submit", {f: self, value:, options:})
    end

    protected

    def render_field(type, method, options)
      errors = object.errors.messages_for(method)
      render_partial(type, {f: self, method:, errors:, options:})
    end

    def render_partial(partial_name, locals = {})
      partial_path = "layouts/form/#{partial_name}"
      raise "Please provide #{partial_path} partial" unless @template.lookup_context.exists?(partial_path, [], true) # true stands for partial
      @template.render(partial: partial_path, locals:)
    end
  end
end
