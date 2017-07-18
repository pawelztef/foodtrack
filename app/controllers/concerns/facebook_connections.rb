module FacebookConnections
  extend ActiveSupport::Concern  

  def retrive_facebook_page
    begin
      if auth = Koala::Facebook::API.new(session[:auth_token])
        page = auth.get_connections('me', 'accounts').first
        @page_token = page['access_token']
        @page_id = page['id']
        @page_graph = Koala::Facebook::API.new(@page_token)
      else
        redirect_to backend_dashboards_url, notice: 'Token sesji Facebooka wygasł.'
      end
    rescue Koala::Facebook::APIError => e
      redirect_to backend_dashboards_url, notice: 'Tokens sesji Facebooka wygasł.'
    end
  end

  def set_backend_fpost
    @backend_fpost = Fpost.find(params[:id])
  end

  def backend_fpost_params
    params.require(:fpost).permit(:body, :facebook_id, :link_url, :title)
  end

  def post_to_timeline(post)
    post_body = create_fpost_body(post)
    if post.image.present?
      image_url = fpost_image_url(post)
      @page_graph.put_connections(@page_id, 'feed', message: post_body, picture: image_url, link: image_url)
    elsif post.link_url.present?
      post_link = create_fpost_link(post)
      @page_graph.put_connections(@page_id, 'feed', message: post_body, picture: nil, link: post_link)
    else
      @page_graph.put_connections(@page_id, 'feed', message: post_body, picture: nil, link: nil)
    end
  end

  def create_fpost_body(post)
    "#{post.title}\r\n #{post.body}"
  end
  def create_fpost_link(post)
    if Rails.env == "development"
      "http://google.com"
    else
      post.link_url 
    end
  end

  def fpost_image_url(post)
    if Rails.env == "development"
      "http://r.ddmcdn.com/s_f/o_1/APL/uploads/2014/10/5-human-foods-cats-can-eat0.jpg" 
    else
      root_url + post.image.image_url unless post.image.nil?
    end
  end



end
