class ReactInitialState
  def initialize(user)
    @user = user
  end

  def data
    {raw: {user: {name: @user.display_name}}}
  end
end
