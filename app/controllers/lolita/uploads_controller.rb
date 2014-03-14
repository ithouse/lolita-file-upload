class Lolita::UploadsController < ApplicationController
  include Lolita::ControllerAdditions
  before_filter :authenticate_lolita_user!
  before_filter :set_tab, :only=>[:index,:edit,:update,:destroy,:create]
  before_filter :set_resource, :only=>[:create,:edit,:update,:destroy]
  before_filter :set_file, :only=>[:edit,:update,:destroy,:create]

  respond_to :js,:html

  def index
    render_component *@tab.build("",:list,:file=>@file)
  end

  def create
    authorization_proxy.can?(:create,@file.class)
    @file.send(:"#{@tab.uploader}=",params[:file])
    @file.save! 
    render_component *@tab.build("",:image,:file=>@file, :format => "html")
  end

  def edit
    authorization_proxy.can?(:update,@file.class)
    render_component *@tab.build("",:edit,:file=>@file)
  end

  def update
    authorization_proxy.can?(:update,@file.class)
    @file.update_attributes!(resource_params)
    flash[:notice] = ::I18n.t("lolita.uploads_controller.update.notice")
    render_component *@tab.build("",:update,:file=>@file)
  end

  def destroy
    authorization_proxy.can?(:destroy,@file.class)
    @file.destroy
    render_component *@tab.build("",:destroy,:file=>@file)
  end

  private

  def set_resource
    association_id = params["#{lolita_mapping.singular}_id"] || params[:upload]["#{lolita_mapping.singular}_id"] || params[:upload]["#{@tab.association.options[:as]}_id"]
    self.resource = resource_class.find_by_id(association_id) || resource_class.new
  end

  def build_file
    @file = @tab.association.klass.new
    params[:upload].each do |k,v|
      @file[k] = v
    end
    @file
  end

  def set_file
    dbi=Lolita::DBI::Base.new(@tab.association.klass)
    @file = dbi.find_by_id(params[:id]) || build_file
  end

  def set_tab
    @tab=tab_by_association(params[:association])
  end

  def tab_by_association name
    resource_class.lolita.tabs.detect{|tab| tab.type == :files && (tab.try(:association) && tab.association.name == name.to_sym)}
  end

  def resource_param_name
    @file.class.to_s.underscore.gsub("/","_")
  end

  def resource_params
    params.require(resource_param_name).permit(:asset, :name, :fileable_type, :asset_extension)
  end
end
