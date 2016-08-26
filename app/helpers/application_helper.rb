# frozen_string_literal: true
module ApplicationHelper
  # Seo implementation
  def yield_with_default(holder, default)
    if content_for?(holder)
      content_for(holder).squish
    else
      default
    end
  end
end
