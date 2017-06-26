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

  def post_excerpt(post)
    truncate post.body, length: 60, separator: ''
  end

  def draft(post)
    if post.draft
      "Tak"
    else
      "Nie"
    end
  end

end
