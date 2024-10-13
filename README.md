# PartialForm

TODO: description & benefits
  - see & link https://discuss.rubyonrails.org/t/introduce-a-standard-formbuilder-that-leverages-partials/86790  
  - note: https://github.com/seanpdoyle/view_partial_form_builder

TODO: how to add the gem (bundle add)

## Usage

TODO: Write usage instructions here
  - steal from builder.rb
  - the builder mimics the API of https://api.rubyonrails.org/classes/ActionView/Helpers/FormBuilder.html but with a prefix
  - set it as default form builder: default_form_builder zu docs
  - rails g partial_form:partials (also default & all option)
  - examples for partials in README? (tailwind, nested)
  - how to add a new partial to the builder

```bash
rails g partial_form:partials
```

TODO: add prominent link to the latest documentation: https://motine.github.io/partial_form/

## Develop & Contribute

Bug reports and pull requests are welcome on [GitHub](https://github.com/motine/partial_form).

The easiest way to get a development environment ist to build and use a Docker image:

```bash
# build and enter the dev container
docker build -t partial_form .
docker run -it --rm -v $(pwd):/app -p 3000:3000 partial_form

# useful commands
rake test
rake standard:fix
rake # run both
rake rdoc
_demo_app/bin/rails s -b 0.0.0.0 # start the demo app & visit http://localhost:3000 (the gem is reloaded in a very sloppy manner)
```

## Release

This section is intended for the maintainer.

```shell
# make changes
# review and edit CHANGELOG
# edit lib/partial_form/version.rb
export VERSION=0.0.1
git commit -am "version bump"
git tag $VERSION
gem build partial_form.gemspec
gem push partial_form-$VERSION.gem
git push && git push --tags
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
