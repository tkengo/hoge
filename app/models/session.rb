class Session
  include ActiveModel::Model
  attr_accessor :email, :password

  validates :email, presence: true
  validates :password, presence: true
  validate :exist_user

  def exist_user
    unless User.where(email: email, password: password).exists?
      errors.add(:email, I18n.t('activemodel.errors.messages.invalid_login'))
    end
  end

  def user_id
    User.where(email: email, password: password).first.id
  end
end
