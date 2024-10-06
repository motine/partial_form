# PartialFormBuilder

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/partialed/form/builder`. To experiment with that code, run `bin/console` for an interactive prompt.

```bash
# fish shell; TODO remove
docker build -t partial_form .
docker run -it --rm -v (pwd):/app -p 3000:3000 partial_form


# create a very minimal rails app
rails new test_app --skip-git --skip-docker --skip-keeps --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-active-record --skip-active-job --skip-active-storage --skip-action-cable --skip-asset-pipeline --skip-javascript --skip-hotwire --skip-jbuilder --skip-test --skip-system --skip-bootsnap --skip-rubocop --skip-brakeman --skip-ci --skip-decrypted-diffs
# add this to the Gemfile
#    gem 'partial-form-builder', :path => '..'
# and run bundle install
```

## Release process

TODO

```shell
# review and edit CHANGELOG
# review & edit README
# edit lib/formtastic/version.rb
git ci -am "version bump"                  # commit changes
git tag X.X.X                              # tag the new version in the code base too
gem build formtastic.gemspec               # build the gem
gem push formtastic-X.X.X.gem              # publish the gem
git push && git push --tags                # push to remote
```

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

Install the gem and add to the application's Gemfile by executing:

    $ bundle add UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test-unit` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/partialed-form-builder.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
