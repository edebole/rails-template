source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(".ruby-version").strip

gem 'bootsnap', '~> 1.17', require: false
gem "devise"
gem "rails"
gem "pg"
gem "puma"
gem "turbolinks"
gem "view_component"
gem "webpacker"
gem "next_rails"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "faker"
  gem "standard"
  gem "rspec-rails"
end

group :development do
  gem "listen"
  gem "rack-mini-profiler"
  gem "spring"
  gem "web-console"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
