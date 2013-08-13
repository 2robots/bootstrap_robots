require 'rails/generators'
require 'rails/generators/migration'

module BootstrapRobots
  class InstallGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    desc "BootstrapRobots installation generator"
    source_root File.expand_path('../templates', __FILE__)

    def install

      # install rails_admin
      run 'rails g rails_admin:install'

      # install devise-i18n
      run 'rails g devise:views:locale de'

      # skip cancan installation. we have our own Ability-model

      # install cancan
      run 'rails g paper_trail:install'

      # add our own migration templates
      migration_template 'create_roles.rb', 'db/migrate/create_roles.rb'

      # add seed data
      seed_data = File.read(File.expand_path('../templates', __FILE__) + '/seeds.rb')

      File.open(Rails.root.join("db/seeds.rb"), "w+") do |f|
        f.write(seed_data)
      end

      # enable paper_trail
      rails_admin_insert = File.read(File.expand_path('../templates', __FILE__) + '/rails_admin_insert.rb')
      gsub_file "config/initializers/rails_admin.rb", /# config.audit_with :paper_trail/, rails_admin_insert

      # set rails to de
      gsub_file "config/application.rb", '# config.i18n.default_locale = :[a-z]*', 'config.i18n.default_locale = :de'

      # add cancan rescue to ApplicationController
      application_controller_insert = File.read(File.expand_path('../templates', __FILE__) + '/application_controller.rb')
      gsub_file "app/controllers/application_controller.rb", 'protect_from_forgery with: :exception', application_controller_insert

      # copy locale files to main app config
      files = Dir[File.join(File.expand_path('../../../../locales', __FILE__), "*.yml")]
      FileUtils.cp files, Rails.root.join("config/locales")

    end

    def self.next_migration_number(dirname)
      next_migration_number = current_migration_number(dirname) + 1
      ActiveRecord::Migration.next_migration_number(next_migration_number)
    end
  end
end