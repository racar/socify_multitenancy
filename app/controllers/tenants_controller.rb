class TenantsController < InheritedResources::Base
 layout 'global'
  private

    def tenant_params
      params.require(:tenant).permit(:domain, :owner)
    end
end
