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
  class ActorTokensApi
    property api_client : ApiClient

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create actor token
    # Create an actor token that can be used to impersonate the given user. The `actor` parameter needs to include at least a \"sub\" key whose value is the ID of the actor (impersonating) user.
    # @return [ActorToken]
    def create_actor_token(create_actor_token_request : CreateActorTokenRequest?)
      data, _status_code, _headers = create_actor_token_with_http_info(create_actor_token_request)
      data
    end

    # Create actor token
    # Create an actor token that can be used to impersonate the given user. The &#x60;actor&#x60; parameter needs to include at least a \&quot;sub\&quot; key whose value is the ID of the actor (impersonating) user.
    # @return [Array<(ActorToken, Integer, Hash)>] ActorToken data, response status code and response headers
    def create_actor_token_with_http_info(create_actor_token_request : CreateActorTokenRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: ActorTokensApi.create_actor_token ..."}
      end
      # resource path
      local_var_path = "/actor_tokens"

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
      post_body = create_actor_token_request.to_json

      # return_type
      return_type = "ActorToken"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"ActorTokensApi.create_actor_token",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: ActorTokensApi#create_actor_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return ActorToken.from_json(data), status_code, headers
    end

    # Revoke actor token
    # Revokes a pending actor token.
    # @param actor_token_id [String] The ID of the actor token to be revoked.
    # @return [ActorToken]
    def revoke_actor_token(actor_token_id : String)
      data, _status_code, _headers = revoke_actor_token_with_http_info(actor_token_id)
      data
    end

    # Revoke actor token
    # Revokes a pending actor token.
    # @param actor_token_id [String] The ID of the actor token to be revoked.
    # @return [Array<(ActorToken, Integer, Hash)>] ActorToken data, response status code and response headers
    def revoke_actor_token_with_http_info(actor_token_id : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: ActorTokensApi.revoke_actor_token ..."}
      end
      # verify the required parameter "actor_token_id" is set
      if @api_client.config.client_side_validation && actor_token_id.nil?
        raise ArgumentError.new("Missing the required parameter 'actor_token_id' when calling ActorTokensApi.revoke_actor_token")
      end
      # resource path
      local_var_path = "/actor_tokens/{actor_token_id}/revoke".sub("{" + "actor_token_id" + "}", URI.encode_path(actor_token_id.to_s))

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
      return_type = "ActorToken"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"ActorTokensApi.revoke_actor_token",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: ActorTokensApi#revoke_actor_token\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return ActorToken.from_json(data), status_code, headers
    end
  end
end
