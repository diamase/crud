module ProfilesHelper
  def profile_image_select(user)
    return image_tag user.image.url(:medium),
                     id: 'image-preview',
                     class: 'img-responsive img-circle profile-image'
  if user.aimage.exists?
    image_tag 'default-avatar.jpg', id: 'image-preview',
                                    class: 'img-responsive img-circle
  profile-image'
  end
  end
end
