# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_andion-blog_session',
    :secret      => '225125c04a80c4b11b4f2c245b254453b590f939173fc1daff45e56dd2515db3ff68ab5b51be980fcc3bb60e933e8d9cb6195a2557fda274ae4677c7fd56becd'
  }

  # prawn pdf support
  #Mime::Type.register "application/pdf", :pdf

  # Frozen gems
  config.gem 'yfactorial-utility_scopes',
    :version => '0.2.2',
    :lib => 'utility_scopes',
    :source => 'http://gems.github.com'

  config.gem "authlogic",
    :version => '1.3.9'

  config.gem "mislav-will_paginate",
    :version => '2.3.6',
    :lib => 'will_paginate',
    :source => 'http://gems.github.com'

  config.gem 'paperclip',
    :version => '2.1.2'

  config.gem 'twitter',
    :version => '0.6.11'

  config.gem 'gruff',
    :version => '0.3.4'

#  config.gem 'prawn',
#    :version => '0.4.1'
end

module Twitter
  class Search
    def fetch(force=false)
      if @fetch.nil? || force
        query = @query.dup

        query[:q] = query[:q].join(' ')
        query[:format] = 'json' #This line is the hack and whole reason we're monkey-patching at all.

        response = self.class.get('http://search.twitter.com/search', :query => query, :format => :json)

        @fetch = Mash.new(response)
      end

      @fetch
    end
  end
end


