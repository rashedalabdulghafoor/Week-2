class PassValidator 
  def initialize()
  end
  def self.long(password)
    @pass = password
    if @pass.length > 7
      true
    else
      false
    end
  end

  def self.string_downcase(password)
    @pass = password
    if @pass.index(/[a-z]/) != nil
      true
    else
      false
    end
  end

  def self.string_upcase(password)
    @pass = password
    if @pass.index(/[A-Z]/) != nil
      true
    else
      false
    end
  end
def self.string_number(password)
  @pass = password
  if @pass.index(/[0-9]/) != nil
    true
  else
    false
  end
end
def self.string_spec_char(password)
  @pass = password
  if @pass.index(/[!-+:-@^-_]/) != nil
    true
  else
    false
  end
end

def self.pass_cont_emailvalue(email, password)
  @password = password
  @email = email
  email_elements = @email.split("@")
  if password.include?(email_elements[0]) || password.include?(email_elements[1])
    false
  else
    true
  end
end

end

