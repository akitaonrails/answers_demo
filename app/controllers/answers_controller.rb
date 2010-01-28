class AnswersController < InheritedResources::Base
  respond_to :html
  actions :create
  belongs_to :product
  belongs_to :question
  before_filter :authenticate_user!
  
  def create
    create! do 
      parent_path
    end
  end
  
  protected
    def build_resource
      options = params[resource_instance_name] || {}
      options.merge!(:user_id => current_user.id)
      get_resource_ivar || set_resource_ivar(end_of_association_chain.send(method_for_build, options))
    end
  
    def begin_of_association_chain
      current_user
    end
end