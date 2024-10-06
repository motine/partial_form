require "action_view"

module PartialForm
  ##
  # TODO docs
  # the builder mimics the API of https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html
  # but with a prefix
  #
  # when using this builder it allows to call methods with the `rich_` prefix.
  # the "rich" method tries to find a partial under `views/layouts/form`.
  # e.g. calling `f.rich_text_field :surname` will render the `views/layouts/form/text_field` partial.
  # the partial receives the following options:
  #
  # - f: the builder instance (useful to call the original form builder methods such as `f.text_field`)
  # - input_args: any argument passed to the rich method
  # - input_options: any argument passed
  # - errors: the error messages for the given method name (Array of Strings)
  # - the following kw-args are passed through:
  #     - label, hint
  #     - wrapper_options, label_options

  #     label: "E-Mail" # received by
  #     f.rich_abc :field, "", same_for: :
  #
  # ASSUMPTIONS
  # the first argument of a rich_* helper is always the method name (i.e. the attribute name in the model).

  class Builder < ActionView::Helpers::FormBuilder

    def initialize(*) # :nodoc:
      super
      # CAUTION
      # we want to make sure that fields are not wrapped by a "field_with_errors" proc
      # this change affects all builders working on the current template
      @template.field_error_proc = proc { |html_tag, instance| html_tag }
    end

    # label(method, text = nil, options = {}, &block)

    # button(value = nil, options = {}, &block)
    # submit(value = nil, options = {})

    # checkbox(method, options = {}, checked_value = "1", unchecked_value = "0")
    # radio_button(method, tag_value, options = {})

    SIMPLE_FIELD_HELPER = [ # :nodoc:
      :color_field, :date_field, :datetime_field, :datetime_local_field, :email_field, :file_field,
      :hidden_field, :month_field, :number_field, :password_field, :phone_field, :range_field,
      :search_field, :telephone_field, :text_field, :text_area, :time_field, :url_field, :week_field
    ]

    # TODO add more info to text field

    ##
    # :method: text_field
    # :call-seq: text_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_text_field`.
    # All options are forwarded to the partial. Typically, options such as `label` and `hint` are taken into account with the template.
    # Please checkout the examples in the README.md
    #
    # The partial template usually calls the original field helper which can be found here: [ActionView::Helpers::FormBuilder#text_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-text_field).

    ##
    # :method: color_field
    # :call-seq: color_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_color_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#color_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-color_field).

    ##
    # :method: date_field
    # :call-seq: date_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_date_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#date_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-date_field).

    ##
    # :method: datetime_field
    # :call-seq: datetime_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_datetime_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#datetime_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-datetime_field).

    ##
    # :method: datetime_local_field
    # :call-seq: datetime_local_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_datetime_local_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#text_fielddatetime_local_fieldhttps://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-datetime_local_field).

    ##
    # :method: email_field
    # :call-seq: email_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_email_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#email_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-email_field).

    ##
    # :method: file_field
    # :call-seq: file_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_file_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#file_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-file_field).

    ##
    # :method: hidden_field
    # :call-seq: hidden_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_hidden_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#hidden_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-hidden_field).

    ##
    # :method: month_field
    # :call-seq: month_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_month_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#month_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-month_field).

    ##
    # :method: number_field
    # :call-seq: number_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_number_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#number_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-number_field).

    ##
    # :method: password_field
    # :call-seq: password_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_password_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#password_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-password_field).

    ##
    # :method: phone_field
    # :call-seq: phone_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_phone_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#phone_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-phone_field).

    ##
    # :method: range_field
    # :call-seq: range_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_range_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#range_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-range_field).

    ##
    # :method: search_field
    # :call-seq: search_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_search_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#search_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-search_field).

    ##
    # :method: telephone_field
    # :call-seq: telephone_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_telephone_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#telephone_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-telephone_field).

    ##
    # :method: text_area
    # :call-seq: text_area(method, options = {})
    #
    # Renders the partial `views/layouts/form/_text_area`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#text_area](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-text_area).

    ##
    # :method: time_field
    # :call-seq: time_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_time_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#time_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-time_field).

    ##
    # :method: url_field
    # :call-seq: url_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_url_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#url_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-url_field).

    ##
    # :method: week_field
    # :call-seq: week_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_week_field`.
    #
    # Please see #_text_field and [ActionView::Helpers::FormBuilder#week_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-week_field).

    SIMPLE_FIELD_HELPER.each do |method_name|
      define_method "_#{method_name}" do |method, options = {}|
        render_simple_field(__method__, method, options)
      end
    end

    # TODO
    # select(method, choices = nil, options = {}, html_options = {}, &block)
    # collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
    # grouped_collection_select(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
    # time_zone_select(method, priority_zones = nil, options = {}, html_options = {})
    # weekday_select(method, options = {}, html_options = {})
    # collection_checkboxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
    # collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)

    def _label(method, text = nil, options = {}, &block)
      errors = object.errors.messages_for(method)
      render_partial("label", {f: self, method:, text:, errors:, options:, block:})
    end

    def _submit(value = nil, options = {})
      render_partial("submit", {f: self, value:, options:})
    end

    protected

    def render_simple_field(type_with_prefix, method, options) # :nodoc:
      type = type_with_prefix.to_s.delete_prefix("_")
      errors = object.errors.messages_for(method)
      render_partial(type, {f: self, method:, errors:, options:})
    end

    # Renders the partial with the given name, forwarding the locals to it.
    def render_partial(partial_name, locals = {})
      partial_path = "layouts/form/#{partial_name}"
      raise "Please provide #{partial_path} partial" unless @template.lookup_context.exists?(partial_path, [], true) # true stands for partial
      @template.render(partial: partial_path, locals:)
    end
  end
end
