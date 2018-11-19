class Session::Remember
  include Interactor

  before do
    unless user && session
      context.error = "called without user and/or session"
      context.fail!
    end
  end

  def call

    # TODO
  end

  def user
    context.user
  end

  def session
    context.session
  end
end
