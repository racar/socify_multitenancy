ActiveAdmin.register_page "Dashboard", :namespace => :superad do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    columns do
      column do
        panel "Instancias o tenants creados" do
          ul do

            Tenant.order("updated_at desc").limit(20).map do |tenant|
              
              li link_to(tenant.domain, superad_tenant_path(tenant))
            end
          end
        end
      end
      column do
        panel "Administrador general" do
           span "Este es el administrador general del sistema"

        end
      end
    end

  end # content
end
