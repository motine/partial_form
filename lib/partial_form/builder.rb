require "action_view"

module PartialForm
  ##
  # TODO docs
  # the builder mimics the API of https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html
  # but with a prefix
  #
  # please also see README
  #
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

    SIMPLE_FIELD_HELPER = [ # :nodoc:
      :color_field, :date_field, :datetime_field, :datetime_local_field, :email_field, :file_field,
      :hidden_field, :month_field, :number_field, :password_field, :phone_field, :range_field,
      :search_field, :telephone_field, :text_field, :text_area, :time_field, :url_field, :week_field
    ]

    ##
    # :method: _text_field
    # :call-seq: _text_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_text_field`.
    # All options are forwarded to the partial. Typically, options such as `label` and `hint` are taken into account with the template.
    # Please checkout the examples in the README.md
    #
    # The partial template usually wraps the original field helper which can be found here: [ActionView::Helpers::FormBuilder#text_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-text_field).

    ##
    # :method: _color_field
    # :call-seq: _color_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_color_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#color_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-color_field).

    ##
    # :method: _date_field
    # :call-seq: _date_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_date_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#date_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-date_field).

    ##
    # :method: _datetime_field
    # :call-seq: _datetime_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_datetime_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#datetime_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-datetime_field).

    ##
    # :method: _datetime_local_field
    # :call-seq: _datetime_local_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_datetime_local_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#text_fielddatetime_local_fieldhttps://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-datetime_local_field).

    ##
    # :method: _email_field
    # :call-seq: _email_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_email_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#email_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-email_field).

    ##
    # :method: _file_field
    # :call-seq: _file_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_file_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#file_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-file_field).

    ##
    # :method: _hidden_field
    # :call-seq: _hidden_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_hidden_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#hidden_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-hidden_field).

    ##
    # :method: _month_field
    # :call-seq: _month_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_month_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#month_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-month_field).

    ##
    # :method: _number_field
    # :call-seq: _number_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_number_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#number_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-number_field).

    ##
    # :method: _password_field
    # :call-seq: _password_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_password_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#password_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-password_field).

    ##
    # :method: _phone_field
    # :call-seq: _phone_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_phone_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#phone_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-phone_field).

    ##
    # :method: _range_field
    # :call-seq: _range_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_range_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#range_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-range_field).

    ##
    # :method: _search_field
    # :call-seq: _search_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_search_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#search_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-search_field).

    ##
    # :method: _telephone_field
    # :call-seq: _telephone_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_telephone_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#telephone_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-telephone_field).

    ##
    # :method: _text_area
    # :call-seq: _text_area(method, options = {})
    #
    # Renders the partial `views/layouts/form/_text_area`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#text_area](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-text_area).

    ##
    # :method: _time_field
    # :call-seq: _time_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_time_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#time_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-time_field).

    ##
    # :method: _url_field
    # :call-seq: _url_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_url_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#url_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-url_field).

    ##
    # :method: _week_field
    # :call-seq: _week_field(method, options = {})
    #
    # Renders the partial `views/layouts/form/_week_field`.
    #
    # Please see #_text_field for more details. The partial template usually wraps [ActionView::Helpers::FormBuilder#week_field](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-week_field).

    SIMPLE_FIELD_HELPER.each do |method_name|
      define_method :"_#{method_name}" do |method, options = {}|
        render_simple_field(__method__, method, options)
      end
    end

    ##
    # Renders the partial `views/layouts/form/_label`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#label](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-label).
    def _label(method, text = nil, options = {}, &block)
      errors = object.errors.messages_for(method)
      render_partial("label", {f: self, method:, text:, errors:, options:, block:})
    end

    ##
    # Renders the partial `views/layouts/form/_button`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#button](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-button).
    def _button(value = nil, options = {}, &block)
      render_partial("button", {f: self, value:, options:, block:})
    end

    ##
    # Renders the partial `views/layouts/form/_submit`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#submit](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-submit).
    def _submit(value = nil, options = {})
      render_partial("submit", {f: self, value:, options:})
    end

    ##
    # Renders the partial `views/layouts/form/_check_box`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#check_box](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-check_box).
    def _check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      errors = object.errors.messages_for(method)
      render_partial("check_box", {f: self, method:, options:, checked_value:, unchecked_value:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_radio_button`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#radio_button](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-radio_button).
    def _radio_button(method, tag_value, options = {})
      errors = object.errors.messages_for(method)
      render_partial("radio_button", {f: self, method:, tag_value:, options:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_select`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#select](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-select).
    def _select(method, choices = nil, options = {}, html_options = {}, &block)
      errors = object.errors.messages_for(method)
      render_partial("select", {f: self, method:, choices:, options:, html_options:, block:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_collection_select`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#collection_select](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_select).
    def _collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      errors = object.errors.messages_for(method)
      render_partial("collection_select", {f: self, method:, collection:, value_method:, text_method:, options:, html_options:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_grouped_collection_select`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#grouped_collection_select](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-grouped_collection_select).
    def _grouped_collection_select(method, collection, group_method, group_label_method, option_key_method, option_value_method, options = {}, html_options = {})
      errors = object.errors.messages_for(method)
      render_partial("grouped_collection_select", {f: self, method:, collection:, group_method:, group_label_method:, option_key_method:, option_value_method:, options:, html_options:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_time_zone_select`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#time_zone_select](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-time_zone_select).
    def _time_zone_select(method, priority_zones = nil, options = {}, html_options = {})
      errors = object.errors.messages_for(method)
      render_partial("time_zone_select", {f: self, method:, priority_zones:, options:, html_options:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_weekday_select`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#weekday_select](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-weekday_select).
    def _weekday_select(method, options = {}, html_options = {})
      errors = object.errors.messages_for(method)
      render_partial("weekday_select", {f: self, method:, options:, html_options:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_collection_check_boxes`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#collection_check_boxes](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_check_boxes).
    def _collection_check_boxes(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      errors = object.errors.messages_for(method)
      render_partial("collection_check_boxes", {f: self, method:, collection:, value_method:, text_method:, options:, html_options:, block:, errors:})
    end

    ##
    # Renders the partial `views/layouts/form/_collection_radio_buttons`.
    #
    # The partial template usually wraps [ActionView::Helpers::FormBuilder#collection_radio_buttons](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html#method-i-collection_radio_buttons).
    def _collection_radio_buttons(method, collection, value_method, text_method, options = {}, html_options = {}, &block)
      errors = object.errors.messages_for(method)
      render_partial("collection_radio_buttons", {f: self, method:, collection:, value_method:, text_method:, options:, html_options:, block:, errors:})
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
