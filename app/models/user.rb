class User < ActiveRecord::Base
  def self.from_omniauth auth
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.name = auth.info.name
      user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_token_secret = auth.credentials.secret
      user.save!
    end
  end
end
