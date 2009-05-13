# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #
  # Returns a back to blog index page if this is not the index page
  #
  def back_to_index_link
    unless current_page?(:controller => 'posts', :action => 'index') or current_page?('/blog')
	    link_to '&laquo; Back to blog index', blog_path, :class=>"back_header"
	  end
  end
  
  #
  # Returns a log in link if the user is logged out & in the main page
  #
  def log_in_link
    if current_page?(:controller => 'posts', :action => 'index') or
        current_page?('/blog') and !current_user
	    link_to 'Log in', new_user_session_path, :class=>"login"
	  end    
  end
 
  #
  # Render a login or logout link
  # 
  def log_in_or_log_out_link
    if current_user
        link_to "Logout", user_session_path, :method => :delete
    else
        link_to 'Log in', new_user_session_path, :class=>"login"
    end    
  end
  
  def link_to_if_authenticated(name, options = {}, html_options = nil)
    if current_user
      link_to(name, options = {}, html_options = nil)      
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
