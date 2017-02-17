class UserMailer < ApplicationMailer
  default from: "ninetyninecatsadmin@example.com"

  #This will send a welcome email to all new users!
  def welcome_email(user)
    @user = user
    mail(to: @user.username, subject: "Welcome to 99 Cats!")
  end
end
