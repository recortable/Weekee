class ResourceController < ApplicationController
  respond_to :html, :json

  expose(:editable_attributes) { resource_class.attribute_names - %w(id created_at updated_at) }
  expose(:resource_class) { "#{resource_name}".camelcase.constantize }
  expose(:resource) { send(resource_name) }
  expose(:collection) { send(resource_name.pluralize) }

  def index
    respond_with collection
  end

  def show
    respond_with resource
  end

  def new
    respond_with resource
  end

  def edit
    respond_with resource
  end

  def update
    update!([resource])
  end

  def create
    create!([resource])
  end

  def destroy
    destroy!([resource])
  end

  protected
  def create!(url)
    resource.author = current_user if resource.respond_to? :author
    if resource.save
      flash[:notice] = t("#{resource_name}.flash.created")
    else
      flash[:notice] = t("common.flash.error")
    end

    respond_with resource, location: url
  end

  def update!(url)
    data = params[resource_name]
    result = resource.update_attributes(data) ? 'updated' : 'update_error'
    flash[:notice] = t("#{resource_name}.flash.#{result}")
    respond_with resource, location: url
  end

  def destroy!(url)
    result = resource.destroy ? 'destroyed' : 'destroy_error'
    flash[:notice] = t("#{resource_name}.flash.#{result}")
    respond_with resource, location: url
  end


  def self.resource(resource_name)
    define_method 'resource_name' do
      resource_name.to_s
    end
  end
end