class UserSerializer < ActiveModel::Serializer
  attributes :name, :age, :active, :message

  has_many :posts

  def message
    if object.age > 18
      'Es mayor de edad'
    else
      'Es menor de edad'
    end
  end


end
