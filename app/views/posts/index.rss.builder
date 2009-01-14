xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Posts in andion's blog"
    xml.description "RSS Channel with the 20 most recent posts"
    xml.lastBuildDate Time.current.to_s(:rfc822)
    xml.link posts_url
    xml.ttl 1

    xml.image do
      xml.title "Andion's Blog"
      xml.link "http://andion.morphexchange.com/"
    end
    
    for post in @posts
      xml.item do
        xml.title post.title
        xml.description post.content
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.guid post_url(post)
      end
    end
  end
end