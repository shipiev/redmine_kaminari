require 'redmine_kaminari/version'
require 'redmine_kaminari/engine'
require 'redmine_kaminari/kaminari'
require 'redmine_kaminari/kaminari/action_view_extension_patch'

module RedmineKaminari
  # Your code goes here...
end

unless Kaminari::ActionViewExtension.included_modules.include? RedmineKaminari::Kaminari::ActionViewExtensionPatch
  Kaminari::ActionViewExtension.send(:include, RedmineKaminari::Kaminari::ActionViewExtensionPatch)
end