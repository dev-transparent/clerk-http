# #Clerk Backend API
#
##The Clerk REST Backend API, meant to be accessed by backend servers.  ### Versions  When the API changes in a way that isn't compatible with older versions, a new version is released. Each version is identified by its release date, e.g. `2025-03-12`. For more information, please see [Clerk API Versions](https://clerk.com/docs/versioning/available-versions).  Please see https://clerk.com/docs for more information.
#
#The version of the OpenAPI document: 2025-03-12
#Contact: support@clerk.com
#Generated by: https://openapi-generator.tech
#Generator version: 7.12.0
#

require "uri"

module Clerk
  class SessionsApi
    property api_client : ApiClient

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create a new active session
    # Create a new active session for the provided user ID.  **This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend, we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.
    # @return [Session]
    def create_session(create_session_request : CreateSessionRequest?)
      data, _status_code, _headers = create_session_with_http_info(create_session_request)
      data
    end

    # Create a new active session
    # Create a new active session for the provided user ID.  **This operation is intended only for use in testing, and is not available for production instances.** If you are looking to generate a user session from the backend, we recommend using the [Sign-in Tokens](https://clerk.com/docs/reference/backend-api/tag/Sign-in-Tokens#operation/CreateSignInToken) resource instead.
    # @return [Array<(Session, Integer, Hash)>] Session data, response status code and response headers
    def create_session_with_http_info(create_session_request : CreateSessionRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.create_session ..."}
      end
      # resource path
      local_var_path = "/sessions"

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])
      # HTTP header "Content-Type"
      header_params["Content-Type"] = @api_client.select_header_content_type(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = create_session_request.to_json

      # return_type
      return_type = "Session"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"SessionsApi.create_session",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#create_session\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Session.from_json(data), status_code, headers
    end

    # Create a session token
    # Creates a session JSON Web Token (JWT) based on a session.
    # @param session_id [String] The ID of the session
    # @return [CreateSessionToken200Response]
    def create_session_token(session_id : String, create_session_token_request : CreateSessionTokenRequest?)
      data, _status_code, _headers = create_session_token_with_http_info(session_id, create_session_token_request)
      data
    end

    # Create a session token
    # Creates a session JSON Web Token (JWT) based on a session.
    # @param session_id [String] The ID of the session
    # @return [Array<(CreateSessionToken200Response, Integer, Hash)>] CreateSessionToken200Response data, response status code and response headers
    def create_session_token_with_http_info(session_id : String, create_session_token_request : CreateSessionTokenRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.create_session_token ..."}
      end
      # verify the required parameter "session_id" is set
      if @api_client.config.client_side_validation && session_id.nil?
        raise ArgumentError.new("Missing the required parameter 'session_id' when calling SessionsApi.create_session_token")
      end
      # resource path
      local_var_path = "/sessions/{session_id}/tokens".sub("{" + "session_id" + "}", URI.encode_path(session_id.to_s))

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])
      # HTTP header "Content-Type"
      header_params["Content-Type"] = @api_client.select_header_content_type(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = create_session_token_request.to_json

      # return_type
      return_type = "CreateSessionToken200Response"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"SessionsApi.create_session_token",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#create_session_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return CreateSessionToken200Response.from_json(data), status_code, headers
    end

    # Create a session token from a jwt template
    # Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance
    # @param session_id [String] The ID of the session
    # @param template_name [String] The name of the JWT Template defined in your instance (e.g. &#x60;custom_hasura&#x60;).
    # @return [CreateSessionToken200Response]
    def create_session_token_from_template(session_id : String, template_name : String, create_session_token_from_template_request : CreateSessionTokenFromTemplateRequest?)
      data, _status_code, _headers = create_session_token_from_template_with_http_info(session_id, template_name, create_session_token_from_template_request)
      data
    end

    # Create a session token from a jwt template
    # Creates a JSON Web Token(JWT) based on a session and a JWT Template name defined for your instance
    # @param session_id [String] The ID of the session
    # @param template_name [String] The name of the JWT Template defined in your instance (e.g. &#x60;custom_hasura&#x60;).
    # @return [Array<(CreateSessionToken200Response, Integer, Hash)>] CreateSessionToken200Response data, response status code and response headers
    def create_session_token_from_template_with_http_info(session_id : String, template_name : String, create_session_token_from_template_request : CreateSessionTokenFromTemplateRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.create_session_token_from_template ..."}
      end
      # verify the required parameter "session_id" is set
      if @api_client.config.client_side_validation && session_id.nil?
        raise ArgumentError.new("Missing the required parameter 'session_id' when calling SessionsApi.create_session_token_from_template")
      end
      # verify the required parameter "template_name" is set
      if @api_client.config.client_side_validation && template_name.nil?
        raise ArgumentError.new("Missing the required parameter 'template_name' when calling SessionsApi.create_session_token_from_template")
      end
      # resource path
      local_var_path = "/sessions/{session_id}/tokens/{template_name}".sub("{" + "session_id" + "}", URI.encode_path(session_id.to_s)).sub("{" + "template_name" + "}", URI.encode_path(template_name.to_s))

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])
      # HTTP header "Content-Type"
      header_params["Content-Type"] = @api_client.select_header_content_type(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = create_session_token_from_template_request.to_json

      # return_type
      return_type = "CreateSessionToken200Response"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"SessionsApi.create_session_token_from_template",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#create_session_token_from_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return CreateSessionToken200Response.from_json(data), status_code, headers
    end

    # Retrieve a session
    # Retrieve the details of a session
    # @param session_id [String] The ID of the session
    # @return [Session]
    def get_session(session_id : String)
      data, _status_code, _headers = get_session_with_http_info(session_id)
      data
    end

    # Retrieve a session
    # Retrieve the details of a session
    # @param session_id [String] The ID of the session
    # @return [Array<(Session, Integer, Hash)>] Session data, response status code and response headers
    def get_session_with_http_info(session_id : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.get_session ..."}
      end
      # verify the required parameter "session_id" is set
      if @api_client.config.client_side_validation && session_id.nil?
        raise ArgumentError.new("Missing the required parameter 'session_id' when calling SessionsApi.get_session")
      end
      # resource path
      local_var_path = "/sessions/{session_id}".sub("{" + "session_id" + "}", URI.encode_path(session_id.to_s))

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = nil

      # return_type
      return_type = "Session"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"SessionsApi.get_session",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#get_session\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Session.from_json(data), status_code, headers
    end

    # List all sessions
    # Returns a list of all sessions. The sessions are returned sorted by creation date, with the newest sessions appearing first. **Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however moving forward at least one of `client_id` or `user_id` parameters should be provided.
    # @return [Array(Session)]
    def get_session_list(client_id : String?, user_id : String?, status : String?, paginated : Bool?, limit : Int32?, offset : Int32?)
      data, _status_code, _headers = get_session_list_with_http_info(client_id, user_id, status, paginated, limit, offset)
      data
    end

    # List all sessions
    # Returns a list of all sessions. The sessions are returned sorted by creation date, with the newest sessions appearing first. **Deprecation Notice (2024-01-01):** All parameters were initially considered optional, however moving forward at least one of &#x60;client_id&#x60; or &#x60;user_id&#x60; parameters should be provided.
    # @return [Array<(Array(Session), Integer, Hash)>] Array(Session) data, response status code and response headers
    def get_session_list_with_http_info(client_id : String?, user_id : String?, status : String?, paginated : Bool?, limit : Int32?, offset : Int32?)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.get_session_list ..."}
      end
      allowable_values = ["abandoned", "active", "ended", "expired", "removed", "replaced", "revoked"]
      if @api_client.config.client_side_validation && status && !allowable_values.includes?(status)
        raise ArgumentError.new("invalid value for \"status\", must be one of #{allowable_values}")
      end
      if @api_client.config.client_side_validation && !limit.nil? && limit > 500
        raise ArgumentError.new("invalid value for \"limit\" when calling SessionsApi.get_session_list, must be smaller than or equal to 500.")
      end

      if @api_client.config.client_side_validation && !limit.nil? && limit < 1
        raise ArgumentError.new("invalid value for \"limit\" when calling SessionsApi.get_session_list, must be greater than or equal to 1.")
      end

      if @api_client.config.client_side_validation && !offset.nil? && offset < 0
        raise ArgumentError.new("invalid value for \"offset\" when calling SessionsApi.get_session_list, must be greater than or equal to 0.")
      end

      # resource path
      local_var_path = "/sessions"

      # query parameters
      query_params = Hash(String, String).new
      query_params["client_id"] = client_id.to_s unless client_id.nil?
      query_params["user_id"] = user_id.to_s unless user_id.nil?
      query_params["status"] = status.to_s unless status.nil?
      query_params["paginated"] = paginated.to_s unless paginated.nil?
      query_params["limit"] = limit.to_s unless limit.nil?
      query_params["offset"] = offset.to_s unless offset.nil?

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = nil

      # return_type
      return_type = "Array(Session)"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"SessionsApi.get_session_list",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#get_session_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Array(Session).from_json(data), status_code, headers
    end

    # Refresh a session
    # Refreshes a session by creating a new session token. A 401 is returned when there are validation errors, which signals the SDKs to fallback to the handshake flow.
    # @param session_id [String] The ID of the session
    # @return [SessionRefresh]
    def refresh_session(session_id : String, refresh_session_request : RefreshSessionRequest?)
      data, _status_code, _headers = refresh_session_with_http_info(session_id, refresh_session_request)
      data
    end

    # Refresh a session
    # Refreshes a session by creating a new session token. A 401 is returned when there are validation errors, which signals the SDKs to fallback to the handshake flow.
    # @param session_id [String] The ID of the session
    # @return [Array<(SessionRefresh, Integer, Hash)>] SessionRefresh data, response status code and response headers
    def refresh_session_with_http_info(session_id : String, refresh_session_request : RefreshSessionRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.refresh_session ..."}
      end
      # verify the required parameter "session_id" is set
      if @api_client.config.client_side_validation && session_id.nil?
        raise ArgumentError.new("Missing the required parameter 'session_id' when calling SessionsApi.refresh_session")
      end
      # resource path
      local_var_path = "/sessions/{session_id}/refresh".sub("{" + "session_id" + "}", URI.encode_path(session_id.to_s))

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])
      # HTTP header "Content-Type"
      header_params["Content-Type"] = @api_client.select_header_content_type(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = refresh_session_request.to_json

      # return_type
      return_type = "SessionRefresh"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"SessionsApi.refresh_session",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#refresh_session\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return SessionRefresh.from_json(data), status_code, headers
    end

    # Revoke a session
    # Sets the status of a session as \"revoked\", which is an unauthenticated state. In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.
    # @param session_id [String] The ID of the session
    # @return [Session]
    def revoke_session(session_id : String)
      data, _status_code, _headers = revoke_session_with_http_info(session_id)
      data
    end

    # Revoke a session
    # Sets the status of a session as \&quot;revoked\&quot;, which is an unauthenticated state. In multi-session mode, a revoked session will still be returned along with its client object, however the user will need to sign in again.
    # @param session_id [String] The ID of the session
    # @return [Array<(Session, Integer, Hash)>] Session data, response status code and response headers
    def revoke_session_with_http_info(session_id : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.revoke_session ..."}
      end
      # verify the required parameter "session_id" is set
      if @api_client.config.client_side_validation && session_id.nil?
        raise ArgumentError.new("Missing the required parameter 'session_id' when calling SessionsApi.revoke_session")
      end
      # resource path
      local_var_path = "/sessions/{session_id}/revoke".sub("{" + "session_id" + "}", URI.encode_path(session_id.to_s))

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = nil

      # return_type
      return_type = "Session"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"SessionsApi.revoke_session",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#revoke_session\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Session.from_json(data), status_code, headers
    end

    # Verify a session
    # Returns the session if it is authenticated, otherwise returns an error. WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,          which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).          For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).
    # @param session_id [String] The ID of the session
    # @return [Session]
    def verify_session(session_id : String, verify_session_request : VerifySessionRequest?)
      data, _status_code, _headers = verify_session_with_http_info(session_id, verify_session_request)
      data
    end

    # Verify a session
    # Returns the session if it is authenticated, otherwise returns an error. WARNING: This endpoint is deprecated and will be removed in future versions. We strongly recommend switching to networkless verification using short-lived session tokens,          which is implemented transparently in all recent SDK versions (e.g. [NodeJS SDK](https://clerk.com/docs/backend-requests/handling/nodejs#clerk-express-require-auth)).          For more details on how networkless verification works, refer to our [Session Tokens documentation](https://clerk.com/docs/backend-requests/resources/session-tokens).
    # @param session_id [String] The ID of the session
    # @return [Array<(Session, Integer, Hash)>] Session data, response status code and response headers
    def verify_session_with_http_info(session_id : String, verify_session_request : VerifySessionRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: SessionsApi.verify_session ..."}
      end
      # verify the required parameter "session_id" is set
      if @api_client.config.client_side_validation && session_id.nil?
        raise ArgumentError.new("Missing the required parameter 'session_id' when calling SessionsApi.verify_session")
      end
      # resource path
      local_var_path = "/sessions/{session_id}/verify".sub("{" + "session_id" + "}", URI.encode_path(session_id.to_s))

      # query parameters
      query_params = Hash(String, String).new

      # header parameters
      header_params = Hash(String, String).new
      # HTTP header "Accept" (if needed)
      header_params["Accept"] = @api_client.select_header_accept(["application/json"])
      # HTTP header "Content-Type"
      header_params["Content-Type"] = @api_client.select_header_content_type(["application/json"])

      # form parameters
      form_params = Hash(Symbol, (String | ::File)).new

      # http body (model)
      post_body = verify_session_request.to_json

      # return_type
      return_type = "Session"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"SessionsApi.verify_session",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: SessionsApi#verify_session\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Session.from_json(data), status_code, headers
    end
  end
end
