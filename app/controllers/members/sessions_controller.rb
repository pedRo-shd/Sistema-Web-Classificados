class Members::SessionsController < Devise::SessionsController
  protected
  # Redireciona member a este path após logar, método customizado do devise,
  # para mais detalhes ver documentação Devise Redirect:
  # https://github.com/plataformatec/devise/wiki/How-To:-redirect-to-a-specific-page-on-successful-sign-in
    def after_sign_in_path_for(resource)
      site_profile_dashboard_index_path
    end

    # def after_update_path_for(resource)
    #   signed_in_root_path(resource)
    # end
end
