class Table
  attr_accessor :width, :length

  # default width and length is set to 5 * 5
  def initialize params = {}
    @width = params.fetch(:width, 5)
    @length = params.fetch(:length, 5)
  end
end
