module CustomTokenResponse
  def body
		if @token.resource_owner_id
			client = User.find(@token.resource_owner_id)
		end 
			
    # call original `#body` method and merge its result with the additional data hash
   	super.merge({
   		status_code: 200,
   		message: I18n.t('devise.sessions.signed_in'),
   		client: client
   	})
  end
end