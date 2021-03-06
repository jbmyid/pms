class ResourceController < ApplicationController
  before_filter :find_resource, except: [:new, :index, :create]
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to unauthorize_redirect_path, alert: "Access denied"
  end

  def index
    set_resource klass.all, pluralize: true
  end

  def new
    set_resource klass.new
  end

  def create
    set_resource klass.new(params[resource_name.to_sym])
    if resource.save
      redirect_to after_create_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if resource.update_attributes(params[resource_name.to_sym])
      redirect_to after_update_path
    else
      render :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to after_destroy_path
  end

  private

  def find_resource
    set_resource klass.find(params[:id])
  end

  def set_resource(val, options={})
    r_name = options[:pluralize] ? resource_name.pluralize : resource_name
    instance_variable_set "@#{r_name}".downcase, val
  end

  def resource
    instance_variable_get "@#{resource_name}".downcase
  end

  def resource_name
    "#{klass.new.class}".underscore
  end

  def after_create_path
    send "#{resource_name.pluralize}_path"
  end

  def after_update_path
    send "#{resource_name.pluralize}_path"
  end

  def after_destroy_path
    send "#{resource_name.pluralize}_path"
  end

  def unauthorize_redirect_path
    return root_path unless current_person
    send "#{current_person.class.to_s.underscore.downcase}_dashboards_path"
  end
end
