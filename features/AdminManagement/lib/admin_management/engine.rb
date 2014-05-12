module AdminManagement
  class Engine < ::Rails::Engine
    isolate_namespace AdminManagement

    initializer "user.assets.precompile" do |app|
      app.config.assets.precompile += %w(moode_user_plugin/login_and_register.css moode_user_plugin/login_and_register.js)
    end

  end
end
