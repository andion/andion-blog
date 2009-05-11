# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #
  # Returns a back to blog index page if this is not the index page
  #
  def back_to_index_link
    unless current_page?(:controller => 'posts', :action => 'index') or current_page?('/blog') or
	    link_to '&laquo; Back to blog index', posts_path, :class=>"back_header"
	  end
  end
  
  #
  # Returns a log in link if the user is logged out & in the main page
  #
  def log_in_link
    if current_page?(:controller => 'posts', :action => 'index') or current_page?('/') and !current_user
	    link_to 'Log in', new_user_session_path, :class=>"login"
	  end    
  end
  
  #
  # Renders the flash messages stored in the :notice and :error keys. This 
  # messages are wrapped by a container marked as "flash notice" and  
  # "flash error" respectively
  #
  def render_flash
    markup = []
    for key in [:notice, :error]        
      if flash[key]
        markup << content_tag(:div, h(flash[key]), :class => "flash #{key}")          
      end
    end      
    markup.join
  end
  
end
