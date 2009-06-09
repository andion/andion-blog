ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'

class ActiveSupport::TestCase

  self.use_transactional_fixtures = true

  self.use_instantiated_fixtures  = true

  fixtures :all

  # Add more helper methods to be used by all tests here...
  
  #
  # There is no assert_not_valid method in Test::Unit::TestCase
  #
  def assert_not_valid(object, msg="Object is valid when it should be invalid")
      assert(!object.valid?, msg)
  end
  alias :assert_invalid :assert_not_valid
  
end
