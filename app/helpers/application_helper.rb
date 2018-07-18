module ApplicationHelper
  def alert_for(flash_type)
    { success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end

  def profile_image_select(user)
    if user.image.exists?
      image_tag user.image.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image'
    else
     image_tag 'default-image.png', id: 'image-preview', class: 'img-responsive img-circle profile-image'
    end
  end
end
