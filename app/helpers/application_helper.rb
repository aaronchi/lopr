module ApplicationHelper
  
  # Finds the correct form path for inherited_resources
  def form_resource_path
    resource.persisted? ? resource_path(resource) : collection_path
  end
  
  def download_bonus_path(bonus)
    bonus.download ? bonus_path(bonus) : bonus.url
  end
  
  def embed_video(id)
    autoplay = current_user && current_user.sign_in_count > 1 ? 0 : 1
    %(<iframe width="560" height="315" src="http://www.youtube.com/embed/#{id}?rel=0&autoplay=#{autoplay}" frameborder="0" allowfullscreen></iframe>).html_safe
  end
  
  def buy_button(extra = false)
    html = "<center>"
    html += %(<h4 class="black"><strong>Click the Add to Cart Button Now<br>and Let's Get Started!</strong></h4>) if extra
    html += link_to image_tag('add-to-cart.png', :width => 280), buy_product_path(@product)
    html += %(<div class="small"><strong>Outside the US? International orders easiest via PayPal.</strong></div>
      <div class="large"><em>As this is a Limited Time Special Offer, All Sales Are Final</em></div>
      <div class="larger"><em>Instant Download / Digital Delivery</em></div>
      </center>)
    html.html_safe
  end
  
end
