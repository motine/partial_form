FROM ruby:3.3

WORKDIR /app

COPY Gemfile Gemfile.lock partial_form.gemspec ./
COPY lib/partial_form/version.rb ./lib/partial_form/

RUN bundle install

EXPOSE 3000
CMD ["/bin/bash"]