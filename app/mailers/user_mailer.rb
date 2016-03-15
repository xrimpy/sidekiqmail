class UserMailer < ActionMailer::Base
  default from: "manmeet@quickcompany.in"

  def welcome()
    mail(to: "manmeet@quickcompany.in", subject: 'Demo mail without SidekiQ')
  end


end
