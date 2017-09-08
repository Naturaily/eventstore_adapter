class EventStoreAdapterRailtie < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__))

  desc "This generator creates an initializer file at config/initializers"
  def copy_initializer
    copy_file "event_store_adapter.rb", "config/initializers/event_store_adapter.rb"
  end
end