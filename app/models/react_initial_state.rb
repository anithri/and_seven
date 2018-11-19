class ReactInitialState
  def initialize(user)
    @user = user
  end

  def data
    {raw: {user: {name: @user.name}}}
  end
end
