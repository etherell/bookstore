# frozen_string_literal: true

class BookDecorator < ApplicationDecorator
  delegate_all
  decorates_association :authors
  PLACEHOLDER_PATH = 'book.jpg'
  MAX_TITLE_LENGTH = 27
  MAX_DESCRIPTION_LENGTH = 250

  def self.collection_decorator_class
    PaginatingDecorator
  end

  def available_image
    images.attached? ? images : PLACEHOLDER_PATH
  end

  def authors_names
    authors.map(&:full_name).join(', ')
  end

  def short_title
    title.truncate(MAX_TITLE_LENGTH)
  end

  def short_description
    return tag.p(description) if description.length < MAX_DESCRIPTION_LENGTH

    short_description_with_button
  end

  def dimensions?
    height && width && depth
  end

  def dimensions
    I18n.t('books.show.dimensions', height: height, width: width, depth: depth)
  end

  def meterials_names
    materials.present? ? materials.pluck(:name).map(&:capitalize).join(', ') : ''
  end

  private

  def short_description_with_button
    tag.p(description.truncate(MAX_DESCRIPTION_LENGTH)) +
      link_to(I18n.t('books.show.read_more'), '', class: 'read-more in-gold-500 ml-10')
  end
end
