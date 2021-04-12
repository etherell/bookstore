# frozen_string_literal: true

class BookDecorator < Draper::Decorator
  delegate_all
  PLACEHOLDER_PATH = 'http://jonathantweedy.com/resources/thumbs/SmashingBook5ResponsiveWebDesign.jpg'

  def available_image = image.attached? ? image : PLACEHOLDER_PATH

  def authors_names = authors.pluck(:name).join(', ')

  def short_title = title.truncate(27, separator: /\s/)
end
