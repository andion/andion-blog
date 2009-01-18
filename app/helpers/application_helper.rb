# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  #
  # Returns a back to blog index page if this is not the index page
  #
  def back_to_index_link
    unless current_page?(:controller => 'posts', :action => 'index') or current_page?('/')
	    link_to '&laquo; Back to blog index', posts_path, :class=>"back_header"
	  end
  end
end
