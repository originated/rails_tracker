require 'rails/generators'
require 'rails/generators/named_base'

module ActiveProgress
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def copy_initializer_file
        copy_file "install.rb", "config/initializers/active_progress.rb"
      end

     end
  end
end