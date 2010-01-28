class QuestionsController < InheritedResources::Base
  respond_to :html
  belongs_to :product
  before_filter :authenticate_user!, :except => [:index]
  
  protected
    def collection
      options = { :page => params[:page] }
      options.merge!(:conditions => ["question like ?", '%' + params[:s] + '%']) if params[:s]
      @questions ||= end_of_association_chain.paginate(options)
    end

    def build_resource
      options = params[resource_instance_name] || {}
      options.merge!(:user_id => current_user.id)
      get_resource_ivar || set_resource_ivar(end_of_association_chain.send(method_for_build, options))
    end

    def begin_of_association_chain
      current_user
    end
end
