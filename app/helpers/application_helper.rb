module ApplicationHelper
  include Reuseable

  def catering_status(query)
    if query.catering_flag
      material_icon.done.css_class('catering-flag')
    else
    end
  end

  def read_status(query)
    if query.read
      fa_icon('envelope-open-o', class: 'status ').html_safe
    else
      fa_icon('envelope-o', class: 'status ').html_safe
    end
  end

  def read_status_class(query)
    'read ' if query.read
  end

  def track_status(track)
    if track.active
      "Tak"
    else
      "Nie"
    end
  end

  def post_excerpt(post, chars)
    text = Rails::Html::FullSanitizer.new.sanitize post.body
    truncate(text, length: chars, separator: '')
  end

  def publish(post)
    if post.draft
      "Tak"
    else
      "Nie"
    end
  end

  def product_publish product
    if product.publish
      "Tak"
    else
      "Nie"
    end
  end
  
  def product_expose product
    if product.expose
      "Tak"
    else
      "Nie"
    end
  end

  def page_logo(size = nil)
    if !Setting.first.image.blank?
      image_tag Setting.first.image_url(size), class: 'logo img-responsive'
    end
  end

  def set_active_class(path, css_class=" active-menu")
    if current_page?(path)
      css_class
    end
  end

  def post_link_img(post)
    if post.image?
      request.base_url + post.image_url
    else
      request.base_url + Setting.first.image_url if Setting.first.image_url
    end
  end

  def set_post_img(post, tag_name)
    if post.image?
      content_tag tag_name.to_sym, nil, class: 'zdj-post', style: "background-image: url(#{post.image_url})"
    else 
      content_tag tag_name.to_sym, nil, class: 'zdj-post'
    end 
  end
  def set_product_img (product, tag_name)
    if product.image?
      content_tag tag_name.to_sym, nil, class: 'zdj-post', style: "background-image: url(#{product.image_url})"
    else 
      content_tag tag_name.to_sym, nil, class: 'zdj-post'
    end 
  end
  def set_product_image (product, tag_name)
    if product.image?
      content_tag tag_name.to_sym, nil, class: 'image-con', style: "background-image: url(#{product.image_url})"
    else 
      content_tag tag_name.to_sym, nil, class: 'image-con'
    end 
  end

  def set_pin(stop)
    if stop.active
      image_tag 'pin-active'
    else
      image_tag 'pin'
    end
  end

  def set_address(stop)
    content_tag :span, class: 'adres' do
      "#{stop.address_line1} #{stop.address_line2} <br /> #{stop.code} #{stop.town}".html_safe
    end
  end

  def stop_working_hours(stop)
    tag_one = content_tag :span, class: 'time' do
      "#{fa_icon('clock-o')} #{stop.date.strftime('%H:%M')} - #{stop.date_out.strftime('%H:%M')}".html_safe
    end
    tag_two = content_tag :sapn, class: 'data' do
      "#{fa_icon('calendar')} #{I18n.localize(stop.date, format: '%d %B %Y')}".html_safe
    end
    (tag_one + tag_two).html_safe
  end

  def stop_working_hours_modal(stop)
    "od: #{I18n.localize(stop.date, format: '%d %b %Y - %H:%M')} <br>do: #{I18n.localize(stop.date_out, format: '%d %b %Y - %H:%M')} ".html_safe
  end


  def set_social_links(settings)
    if settings.social_icons.present?
      settings.social_icons.collect do |i|
        concat(link_to (image_tag i.image_url(:mini)), i.url_address)
      end
    end
  end


end
