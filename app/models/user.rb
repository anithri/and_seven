class User
  EMPLOYEE_FIELDS = %i{id name username mobile phone user_groups}

  attr_reader :employee
  def initialize(employee:)
    @employee = employee
  end

  delegate *EMPLOYEE_FIELDS , to: :employee

  def remember_token
    BCrypt::Password.create(employee.remember_digest).to_s
  end

  def remember!
    employee.regenerate_remember_digest
  end

  def forget!
    employee.regenerate_remember_digest
  end

  def remembered?(token)
    BCrypt::Password.new(token) == employee.remember_digest
  end

  def authenticate(_password)
    true
  end

  def self.find_by_id(id)
    employee = Employee.find_by(id: id)
    return unless employee
    self.new(employee: employee)
  end

  def self.from(employee)
    self.new(employee: employee)
  end
end
