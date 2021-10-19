class User
  def born_on
    Date.new(1989, 9, 10)
  end
end
super
class UserDecorator < SimpleDelegator
  def birth_year
    born_on.year
  end
end

user = User.new
decorated_user = UserDecorator.new(user)
decorated_user.birth_year
decorated_user.born_on