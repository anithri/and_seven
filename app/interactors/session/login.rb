class Session::Login
  include Interactor

  before do
    unless email && password && user
      context.error = "called without email and/or password"
      context.fail!
    end
  end

  def call
    if user.authenticate(password)
      context.notice = "Nice to see you #{user.name}"
    else
      context.error = 'Invalid email/password'
      context.fail!
    end
  end

  def email
    context.params[:email]
  end

  def password
    context.params[:password]
  end

  def employee
    Employee.find_by_email(email)
  end

  def user
    context.user ||= employee ? User.from(employee) : nil
  end
end
