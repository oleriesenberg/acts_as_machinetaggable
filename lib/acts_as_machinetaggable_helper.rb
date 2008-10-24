module ActsAsMachinetaggableHelper
  # Create a link to the machinetag using restful routes and the rel-machinetag microformat
  def link_to_machinetag(machinetag)
    link_to(machinetag.name, machinetag_url(machinetag), :rel => 'machinetag')
  end
  
  # Generate a machinetag cloud of the top 100 machinetags by usage, uses the proposed hMachinetagcloud microformat.
  #
  # Inspired by http://www.juixe.com/techknow/index.php/2006/07/15/acts-as-taggable-tag-cloud/
  def machinetag_cloud(options = {})
    machinetags = Machinetag.find(:all, :limit => options[:limit] || 100, :order => 'machinetaggings_count DESC').sort_by(&options[:sort] || :name)
    
    # TODO: add option to specify which classes you want and overide this if you want?
    classes = %w(popular v-popular vv-popular vvv-popular vvvv-popular vvvvv-popular vvvvvv-popular)
    
    max, min = 0, 0
    machinetags.each do |machinetag|
      max = machinetag.machinetaggings_count if machinetag.machinetaggings_count > max
      min = machinetag.machinetaggings_count if machinetag.machinetaggings_count < min
    end
    
    divisor = ((max - min) / classes.size) + 1
    
    html =    %(<div class="hMachinetagcloud">\n)
    html <<   %(  <ul class="popularity">\n)
    machinetags.each do |machinetag|
      html << %(    <li>)
      title = options[:clear] ? machinetag.name.split("=").last.gsub("+", " ") : machinetag.name
      html << link_to(title, machinetag_url(machinetag), :class => classes[(machinetag.machinetaggings_count - min) / divisor])
      html << %(</li> \n)
    end
    html <<   %(  </ul>\n)
    html <<   %(</div>\n)
  end
end