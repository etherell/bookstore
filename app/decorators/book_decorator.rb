# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all
  PLACEHOLDER_PATH = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'

  def available_image
    image.attached? ? image : PLACEHOLDER_PATH
  end

  def authors_names
    authors.present? ? authors.pluck(:name).join(', ') : ''
  end

  def short_title
    title.truncate(27, separator: /\s/)
  end

  def short_description
    description.truncate(250, separator: /\s/)
  end

  def dimensions?
    height && width && depth
  end

  def dimensions
    "H: #{height} x W: #{width} x D: #{depth} inches"
  end

  def meterials_names
    materials.present? ? materials.pluck(:name).map(&:capitalize).join(', ') : ''
  end
end
