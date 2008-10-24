class ActsAsMachinetaggableStylesheetGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.file "acts_as_machinetaggable_stylesheet.css", "public/stylesheets/acts_as_machinetaggable_stylesheet.css"
    end
  end
end