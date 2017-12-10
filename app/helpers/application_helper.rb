module ApplicationHelper
  def admin_user
    unless signed_in? && current_user.is_admin?
      redirect_to(root_url)
    end
  end

  def full_title(page_title)
    base_title = 'Tomarigi Portfolio'
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def full_description(description)
    base_description = 'トビタテ生が主体的に関わるプロジェクトの可視化を行なっています'
    if description.empty?
      base_description
    else
      "#{description} | #{base_description}"
    end
  end

end
