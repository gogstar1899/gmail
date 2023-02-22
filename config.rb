require 'google/apis/gmail_v1'
require 'googleauth'
require 'googleauth/stores/file_token_store'
require 'mail'

class Config
    CLIENT_SECRET_FILE = 'client_secret.json'
    OOB_URI = 'urn:ietf:wg:oauth:2.0:oob'
    APPLICATION_NAME = 'application'
    @service = Google::Apis::GmailV1::GmailService.new
    @client_id = Google::Auth::ClientId.from_file(CLIENT_SECRET_FILE)
    @token_store = Google::Auth::Stores::FileTokenStore.new(file: 'token.yaml')
    @authorizer = Google::Auth::UserAuthorizer.new(@client_id, 'https://mail.google.com/', @token_store)

    @user_id = 'me'
    @credentials = @authorizer.get_credentials(@user_id)
        if @credentials.nil?
            @url = @authorizer.get_authorization_url(base_url: OOB_URI)
            puts 'Open the following URL in the browser and enter the resulting code after authorization'
            puts @url
            @code = gets
            @credentials = @authorizer.get_and_store_credentials_from_code(user_id: @user_id, code: @code, base_url: OOB_URI)
        end
    
    @service.authorization = @credentials

    email_body = 'This is the mail body'

    mail = Mail.new
    mail.subject = 'This is test mail'
    mail.to = 'gdtesting002@gmail.com'
    mail.part content_type: 'multipart/alternative' do |part|
        part.html_part = Mail::Part.new(body: email_body, content_type: 'text/html')
        part.text_part = Mail::Part.new(body: email_body)
    end

    message_to_send = Google::Apis::GmailV1::Message.new(raw: mail.to_s)
    @service.send_user_message('me', message_to_send)
    
end