class TenantsController < InheritedResources::Base
 layout 'landing'

 def create

   begin

    @tenant = Tenant.new(tenant_params)
    if @tenant.save
      @algo = Apartment::Tenant.current
      Apartment::Tenant.switch!(@tenant.domain)
      AdminUser.create!(email: @tenant.owner, password: 'password', password_confirmation: 'password')

      redirect_to @tenant
    else
      render "new"
    end

   rescue => e
     #byebug
     flash[:notice] = "El dominio ingresado ya existe"
     redirect_to :controller => 'tenants', :action => 'new'
   end

 end


  private

    def tenant_params
      params.require(:tenant).permit(:domain, :owner)
    end


end
