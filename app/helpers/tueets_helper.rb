module TueetsHelper
  def not_following_oneself(user)
    return (!(user.in?(current_user.following)) && current_user != user)
  end
end
