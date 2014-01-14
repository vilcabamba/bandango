class AdminConstraint
  def matches?( request )
    return false unless request.session[:user_id]
    user = User.cached_find request.session[:user_id]
    user
  end
end
