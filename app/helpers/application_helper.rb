module ApplicationHelper
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
    if post.publish
      "Tak"
    else
      "Nie"
    end
  end

  def page_logo
    image_tag Setting.first.image_url(:mini)
  end

end
