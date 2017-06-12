class Tenant < ApplicationRecord
  after_create :create_tenant
  def create_tenant
    #Apartment::Tenant.create(subdomain)
    byebug
    Apartment::Tenant.create(domain)

  end
end
