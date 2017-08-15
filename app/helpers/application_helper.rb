module ApplicationHelper
  include Reuseable

  def catering_status(query)
    if query.catering_flag
      material_icon.done.css_class('text-success catering-flag')
    else
    end
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

  def page_logo(size = nil)
    if !Setting.first.image.blank?
      image_tag Setting.first.image_url(size), class: 'logo img-responsive'
    end
  end

  def set_active_class(path)
    if current_page?(path)
      ' active'
    end
  end

  def post_link_img(post)
    if post.image.blank?
      request.base_url + Setting.first.image_url if Setting.first.image_url
    else
      request.base_url + post.image.image_url
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

end
