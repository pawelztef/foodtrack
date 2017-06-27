module Reuseable
  def fullname
    if self.first_name && self.last_name
      "#{self.first_name.capitalize} #{self.last_name.capitalize}"
    end
  end

  def safe_find(klass)
    Object.const_get(klass).first_or_create(id: 1)
  end
end
