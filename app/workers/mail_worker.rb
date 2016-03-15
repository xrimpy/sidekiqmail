class MailWorker
  include Sidekiq::Worker

  def perform()
  	UserMailer.welcome.deliver
  end

end