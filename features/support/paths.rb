module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'
    
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /the (.+?) page/
      if path = match_rails_path_for(page_name) 
        path
      else 
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
      end
      
    else
      page_name
    end
  end
  
  def match_rails_path_for(page_name)
    return nil unless page_name.match(/the (.+?) page/)
    page_path, args = $1, nil
    if page_path =~ /(.+?)\((.+?)\)/
      page_path, args = $1, $2
    end
    route = "#{page_path.gsub(" ", "_")}_path"
    begin 
      send(route, args.split(","))
    rescue
      raise "Can't find mapping from \"#{route}(#{args})\" to a path."
    end
  end
end

World(NavigationHelpers)
