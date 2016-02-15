class UserMailer < ApplicationMailer
 
  def welcome_email(user)
    @user = user
    @url  = 'http://geargoat.net/sign_in'
    mail(to: @user.email, subject: 'Welcome to Gear Goat')
  end
end
