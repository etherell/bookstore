# frozen_string_literal: true

PagePolicy = Struct.new(:user, :page) do
  def index?
    true
  end
end
