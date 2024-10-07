FROM ruby:3.3

WORKDIR /app

COPY Gemfile Gemfile.lock partial_form.gemspec ./
COPY lib/partial_form/version.rb ./lib/partial_form/
RUN bundle install

COPY _demo_app/Gemfile _demo_app/Gemfile.lock _demo_app/
RUN cd _demo_app && bundle install

EXPOSE 3000
CMD ["/bin/bash"]