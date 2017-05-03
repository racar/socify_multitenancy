class TenantsController < InheritedResources::Base
 layout 'landing'
  private

    def tenant_params
      params.require(:tenant).permit(:domain, :owner)
    end

  
end
