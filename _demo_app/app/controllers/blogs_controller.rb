# Dummy controller for showing off & testing the gem.
class BlogsController < ActionController::Base
  before_action :reload_gem_files
  before_action :set_dummies

  # Dummy model
  class Blog
    include ActiveModel::Model
    def self.model_name = ActiveModel::Name.new(self, nil, "Blog")
    attr_accessor :dummy, :dummy_array
    validates :dummy, :dummy_array, presence: true
  end

  # The GET action shows the fields without validation messages.
  def new
  end

  # The POST action includes validation messages.
  def create
    @blog.valid? # trigger validations
    render :new, status: :unprocessable_entity # always re-render the new template
  end

  protected

  def set_dummies
    @blog = Blog.new
    @collection = ["A", "B", "C"].collect { OpenStruct.new(value: _1, text: _1) }
    @grouped_collection = [
      OpenStruct.new(
        name: "Germany",
        cities: [OpenStruct.new(id: 1, name: "Berlin"), OpenStruct.new(id: 1, name: "Tom Town")]
      )
    ]
  end

  def reload_gem_files
    # very hacky way to ensure that the latest version of the gem's files are reloaded
    files = Dir.glob("#{Rails.root.join("../lib")}/**/*.rb").reject { _1.include?("generator") }
    files.each { |file| load file }
  end
end
