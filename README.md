# PartialForm

Customizable forms for Rails using partials!

The PartialForm gem simplifies the rendering of form fields by providing a `FormBuilder` that leverages partials. This approach streamlines the management and maintenance of the field helper markup.

Potential uses are:

- Show error messages right next to the input field
- Render labels along with the inputs
- Indicate if a field is required or optional
- Keep the field markup & CSS classes consistent throughout the app
- Add more complex input fields (such as a barcode input or a custom date range picker)

## Installation & Usage

You can install the gem using `bundler add partial_form`.

The gem provides a form builder named `PartialForm::Builder`, here an example:

```erb
<%# app/views/article/_form.html.erb %>

<%= form_with model: @article, builder: PartialForm::Builder do |f|  %>
  <%= f._text_field :title # mind the prefix, renders app/views/form/_text_field.html.erb %>
  <%= f._date_field :published_on, hint: "The release date" # pass arbitrary options to the partial %>
  <%= f.text_field :slug # the default form helper is available without prefix %>
<% end %>
```

The `PartialForm::Builder` mimics the API of the [default FormBuilder](https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html) but adds a `_` prefix.
The partial builder comes with default templates for each helper. These render something like this (for an invalid field):

```html
<!-- example for the rendered output of an included template -->
<div class="form-group">
  <label for="article_title">Published On</label>
  <input type="date" name="article[published_on]" id="article_published_on" class="invalid">
  <p class="form-errors">can't be blank</p>
  <p class="form-hint">The release date</p>
</div>
```

If you want to set the builder as default builder for all your forms, you can:

```ruby
class ApplicationController < ActionController::Base
  default_form_builder PartialForm::Builder
end
```

## Documentation

Find the [latest documentation](https://motine.github.io/partial_form/).

Here an extensive list of all helpers: `_label`, `_text_field`, `_color_field`, `_date_field`, `_datetime_field`, `_datetime_local_field`, `_email_field`, `_file_field`, `_hidden_field`, `_month_field`, `_number_field`, `_password_field`, `_phone_field`, `_range_field`, `_search_field`, `_telephone_field`, `_text_area`, `_time_field`, `_url_field`, `_week_field`, `_check_box`, `_radio_button`, `_select`, `_collection_select`, `_grouped_collection_select`, `_time_zone_select`, `_weekday_select`, `_collection_check_boxes`, `_collection_radio_buttons`, `_button`, `_submit`

## Customize the builder

You can copy the standard partials to your application using:

```bash
rails g partial_form:partials
# Which partials do you want to copy? [default, all] default
#   create  app/views/layouts/form/_wrapper.html.erb
#   create  app/views/layouts/form/_text_field.html.erb
#   create  app/views/layouts/form/_label.html.erb
#   create  app/views/layouts/form/_submit.html.erb
```

Here an example how to **customize an existing helper** (`_text_field`) partial:

```erb
<%# available locals: f, method, options, errors; all keyword arguments passed to the `_text_field` are accessible via `options` %>

<%= f.label method, class: "mb-3" # call the default form builder helper %>
<%= f.text_field method, options.merge!(class: class_names(options[:class], "mb-3 border", invalid: errors.any?)) # make sure to retain passed `class` %>

<% if errors.any? -%>
  <p class="mt-4 text-red-200"><%= errors.to_sentence %></p>
<% end %>
```

Please mind that some helpers use `options` and others `html_options` and check the [documentation](https://motine.github.io/partial_form/).

To **add a new helper method**, you can derive from the `PartialForm::Builder` and a new method as well as a partial:

```ruby
class MyBuilder < PartialForm::Builder

  def _fancy_field(method, options = {})
    render_simple_field(:_fancy_field, method, options) # renders the partial `views/layouts/form/_fancy_field` and passes the default arguments such as `f`, `method`, `errors`, etc.
  end

  def _super_fancy_field(bells)
    whistles = Whistle.all
    render_partial("super", {f: self, bells:, whistles:}) # renders `views/layouts/form/_super` and passes `f`, `bells`, `whistles`
  end
end
```

## Develop & Contribute

Bug reports and pull requests are welcome on [GitHub](https://github.com/motine/partial_form).

The easiest way to get a development environment is to build and use a Docker image:

```bash
# build and enter the dev container
docker build -t partial_form .
docker run -it --rm -v $(pwd):/app -p 3000:3000 partial_form

# use the demo app for testing
_demo_app/bin/rails s -b 0.0.0.0 # visit http://localhost:3000 (the gem is reloaded in a very sloppy manner)

# useful commands
rake test
rake standard:fix
rake # run both
rake rdoc
```

## Release

This section is intended for the maintainer.

```shell
# make changes
rake # preflight
# review and edit CHANGELOG.md
# edit lib/partial_form/version.rb
export VERSION=0.1.0
git commit -am "version bump"
git tag $VERSION
gem build partial_form.gemspec
gem push partial_form-$VERSION.gem
git push && git push --tags
```

# Alternatives

Currently, there are multiple ways to solve the problem of adapting the markup for form fields. There is a [dedicated section](https://guides.rubyonrails.org/form_helpers.html#customizing-form-builders) in the [Action View Form Helpers Guide](https://guides.rubyonrails.org/form_helpers.html) on how to customize form elements. Some cases can even be solved with dedicated configuration options such as [field_error_proc](https://guides.rubyonrails.org/configuring.html#config-action-view-field-error-proc).

In my opinion, these approaches are either verbose or too limited to solve the use cases above.

- **Copy the required logic & markup into templates** Repeating the markup in some views may keep the cross-dependencies low. However, copying the same (faulty) markup/logic to all forms, decreases maintainability.
- **Introduce helper methods** Helpers are a very convenient way to refactor repeating code. However, specifying markup in helpers can easily become unreadable if the logic becomes more involved. Also, helpers do not have access to the form object unless passed explicitly.
- **Add a form builder** Form builders are made for adapting and extending form field rendering. They are a great tool. However, similar to introducing helper methods, specifying the markup can become cumbersome ([example gist](https://gist.github.com/motine/dc47f6ceeaaea96e855a2dd7f4ef83ae)) and hard to read.
- **Refactor to partials** Partials are geared towards defining markup structures. They keep code readable even if logic becomes more complicated. However, partials do not have access to the form object per se. Also, using the `render` syntax does not communicate the type of input as well as a form builder method (`render "forms/text_field", method: :title, builder: f` vs. `f.text_field :title`).
- **Pull in a form builder gem** There are [many gems](https://awesome-ruby.com/#-form-builder), that allow customizing form rendering. Each of them, has its own way to adapt the behavior. This requires the developer to learn these ([sometimes complicated](https://github.com/heartcombo/simple_form?tab=readme-ov-file#the-wrappers-api)) concepts. Also, some gems provide additional functionality which may not be needed (e.g. automatic collection population).

If you are interested in more details, please check the discussion on [discuss.rubyonrails.org](https://discuss.rubyonrails.org/t/introduce-a-standard-formbuilder-that-leverages-partials/86790).

The [view_partial_form_builder gem](https://github.com/seanpdoyle/view_partial_form_builder) is similar to this gem, however there are subtle differences.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
