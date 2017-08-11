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

  def page_logo
    if !Setting.first.image.blank?
      image_tag Setting.first.image_url, class: 'logo img-responsive'
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


end
