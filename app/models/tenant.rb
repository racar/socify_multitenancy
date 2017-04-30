class Tenant < ApplicationRecord
  after_create :create_tenant
  def create_tenant
    #Apartment::Tenant.create(subdomain)
    Apartment::Tenant.create(domain)
  end
end
