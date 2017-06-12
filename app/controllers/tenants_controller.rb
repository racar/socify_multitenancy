class TenantsController < InheritedResources::Base
 layout 'landing'

 def create
   params[:domain]
   #begin
    # byebug
   Tenant.create
    #byebug
   AdminUser.create!(email: 'racar@example.com', password: 'password', password_confirmation: 'password')
   #rescue => e
     #byebug
    # flash[:notice] = "El dominio ingresado ya existe"
    # redirect_to :controller => 'tenants', :action => 'new'
   #end

 end


  private

    def tenant_params
      params.require(:tenant).permit(:domain, :owner)
    end


end
