module Admin::UserHelper
  def admin_user
    unless signed_in? && current_user.is_admin?
      redirect_to(root_url)
    end
  end
end
