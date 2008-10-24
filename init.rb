require 'acts_as_machinetaggable'
require 'acts_as_machinetagger'
ActiveRecord::Base.send(:include, ActiveRecord::Acts::Machinetaggable)
ActiveRecord::Base.send(:include, ActiveRecord::Acts::Machinetagger)
ActionView::Base.send(:include, ActsAsMachinetaggableHelper)
