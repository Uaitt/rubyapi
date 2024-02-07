source "https://rubygems.org"

ruby "~> 3.0"

gem "rails"
gem "bootsnap", ">= 1.1.0", require: false
gem "redis"
gem "puma"
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "propshaft"
gem "sqlite3"

gem "elasticsearch-persistence"
gem "opensearch-aws-sigv4"
gem "opensearch-ruby"

gem "http"
gem "typhoeus", require: false
gem "kaminari", "~> 1.2.2"
gem "inline_svg"
gem "tty-spinner", require: false
gem "lograge"
gem "logstash-event"
gem "sitemap_generator"
gem "meta-tags"
gem "rack-attack"
gem "rdoc", require: false
gem "trenni-sanitize", require: false
gem "pastel", require: false
gem "rouge", require: false
gem "rbs", require: false
gem "anyway_config"
gem "dry-struct"
gem "view_component"
gem "dogstatsd-ruby"

group :development, :test do
  gem "debug"
  gem "dotenv-rails"
  gem "factory_bot"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.9"
  gem "standard"
  gem "standard-rails"
  gem "dockerfile-rails"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webmock"
end

group :production do
  gem "ddtrace", require: "ddtrace/auto_instrument"
end
