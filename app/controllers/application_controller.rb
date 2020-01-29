class ApplicationController < ActionController::API
  
  # Google API secrets
  # def google_secrets
  #   Google::APIClient::ClientSecrets.new(
  #     {
  #       "web" =>
  #         {
  #           "access_token" => current_user.token,
  #           "refresh_token" => current_user.refresh_token,
  #           "client_id" => Rails.application.secrets[:google_client_id],
  #           "client_secret" => Rails.application.secrets[:google_secret]
  #         }
  #     }
  #   )
  # end


  # def google_people_service
  #   People::PeopleServiceService.new
  # end


  # # Google contact list (for invitations) | not being used yet
  # People = Google::Apis::PeopleV1
  # def contacts
  #   secrets = Google::APIClient::ClientSecrets.new(
  #     {
  #       "web" =>
  #         {
  #           "access_token" => current_user.token,
  #           "refresh_token" => current_user.refresh_token,
  #           "client_id" => Rails.application.secrets[:google_client_id],
  #           "client_secret" => Rails.application.secrets[:google_secret]
  #         }
  #     }
  #   )
  #   service = People::PeopleServiceService.new
  #   service.authorization = secrets.to_authorization
  #   response = service.list_person_connections(
  #     'people/me',
  #      person_fields: ['names', 'emailAddresses', 'phoneNumbers']
  #   )
  #   render json: response
  # end


  # rescue from cancan accessdenied exception
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to main_app.root_url, notice: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  

end
