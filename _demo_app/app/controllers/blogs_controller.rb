class BlogsController < ActionController::Base
  before_action :reload_gem_files

  # dummy model
  class Blog
    include ActiveModel::Model
    def self.model_name = ActiveModel::Name.new(self, nil, "Blog")
    attr_accessor :title, :author, :email, :dummy, :started_at
    validates :title, :author, presence: true
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params[:blog].permit!)
    @blog.valid? # trigger validations
    render :new, status: :unprocessable_entity # always re-render the new template
  end

  protected

  def reload_gem_files
    # very hacky way to ensure that the latest version of the gem's files are loaded
    files = Dir.glob("#{Rails.root.join("../lib")}/**/*.rb").reject { _1.include?("generator") }
    files.each { |file| load file }
  end
end
