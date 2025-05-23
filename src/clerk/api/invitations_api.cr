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
  class InvitationsApi
    property api_client : ApiClient

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create multiple invitations
    # Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the invitations as emails by setting the `notify` parameter to `true`. There cannot be an existing invitation for any of the email addresses you provide unless you set `ignore_existing` to `true` for specific email addresses. Please note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.
    # @return [Array(Invitation)]
    def create_bulk_invitations(create_bulk_invitations_request_inner : Array(CreateBulkInvitationsRequestInner)?)
      data, _status_code, _headers = create_bulk_invitations_with_http_info(create_bulk_invitations_request_inner)
      data
    end

    # Create multiple invitations
    # Use this API operation to create multiple invitations for the provided email addresses. You can choose to send the invitations as emails by setting the &#x60;notify&#x60; parameter to &#x60;true&#x60;. There cannot be an existing invitation for any of the email addresses you provide unless you set &#x60;ignore_existing&#x60; to &#x60;true&#x60; for specific email addresses. Please note that there must be no existing user for any of the email addresses you provide, and this rule cannot be bypassed.
    # @return [Array<(Array(Invitation), Integer, Hash)>] Array(Invitation) data, response status code and response headers
    def create_bulk_invitations_with_http_info(create_bulk_invitations_request_inner : Array(CreateBulkInvitationsRequestInner)?)
      if @api_client.config.debugging
        Log.debug {"Calling API: InvitationsApi.create_bulk_invitations ..."}
      end
      # resource path
      local_var_path = "/invitations/bulk"

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
      post_body = create_bulk_invitations_request_inner.to_json

      # return_type
      return_type = "Array(Invitation)"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"InvitationsApi.create_bulk_invitations",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: InvitationsApi#create_bulk_invitations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Array(Invitation).from_json(data), status_code, headers
    end

    # Create an invitation
    # Creates a new invitation for the given email address and sends the invitation email. Keep in mind that you cannot create an invitation if there is already one for the given email address. Also, trying to create an invitation for an email address that already exists in your application will result to an error.
    # @return [Invitation]
    def create_invitation(create_invitation_request : CreateInvitationRequest?)
      data, _status_code, _headers = create_invitation_with_http_info(create_invitation_request)
      data
    end

    # Create an invitation
    # Creates a new invitation for the given email address and sends the invitation email. Keep in mind that you cannot create an invitation if there is already one for the given email address. Also, trying to create an invitation for an email address that already exists in your application will result to an error.
    # @return [Array<(Invitation, Integer, Hash)>] Invitation data, response status code and response headers
    def create_invitation_with_http_info(create_invitation_request : CreateInvitationRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: InvitationsApi.create_invitation ..."}
      end
      # resource path
      local_var_path = "/invitations"

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
      post_body = create_invitation_request.to_json

      # return_type
      return_type = "Invitation"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"InvitationsApi.create_invitation",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: InvitationsApi#create_invitation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Invitation.from_json(data), status_code, headers
    end

    # List all invitations
    # Returns all non-revoked invitations for your application, sorted by creation date
    # @return [Array(Invitation)]
    def list_invitations(status : String?, query : String?, order_by : String?, paginated : Bool?, limit : Int32?, offset : Int32?)
      data, _status_code, _headers = list_invitations_with_http_info(status, query, order_by, paginated, limit, offset)
      data
    end

    # List all invitations
    # Returns all non-revoked invitations for your application, sorted by creation date
    # @return [Array<(Array(Invitation), Integer, Hash)>] Array(Invitation) data, response status code and response headers
    def list_invitations_with_http_info(status : String?, query : String?, order_by : String?, paginated : Bool?, limit : Int32?, offset : Int32?)
      if @api_client.config.debugging
        Log.debug {"Calling API: InvitationsApi.list_invitations ..."}
      end
      allowable_values = ["pending", "accepted", "revoked", "expired"]
      if @api_client.config.client_side_validation && status && !allowable_values.includes?(status)
        raise ArgumentError.new("invalid value for \"status\", must be one of #{allowable_values}")
      end
      if @api_client.config.client_side_validation && !limit.nil? && limit > 500
        raise ArgumentError.new("invalid value for \"limit\" when calling InvitationsApi.list_invitations, must be smaller than or equal to 500.")
      end

      if @api_client.config.client_side_validation && !limit.nil? && limit < 1
        raise ArgumentError.new("invalid value for \"limit\" when calling InvitationsApi.list_invitations, must be greater than or equal to 1.")
      end

      if @api_client.config.client_side_validation && !offset.nil? && offset < 0
        raise ArgumentError.new("invalid value for \"offset\" when calling InvitationsApi.list_invitations, must be greater than or equal to 0.")
      end

      # resource path
      local_var_path = "/invitations"

      # query parameters
      query_params = Hash(String, String).new
      query_params["status"] = status.to_s unless status.nil?
      query_params["query"] = query.to_s unless query.nil?
      query_params["order_by"] = order_by.to_s unless order_by.nil?
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
      return_type = "Array(Invitation)"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"InvitationsApi.list_invitations",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: InvitationsApi#list_invitations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Array(Invitation).from_json(data), status_code, headers
    end

    # Revokes an invitation
    # Revokes the given invitation. Revoking an invitation will prevent the user from using the invitation link that was sent to them. However, it doesn't prevent the user from signing up if they follow the sign up flow. Only active (i.e. non-revoked) invitations can be revoked.
    # @param invitation_id [String] The ID of the invitation to be revoked
    # @return [RevokeInvitation200Response]
    def revoke_invitation(invitation_id : String)
      data, _status_code, _headers = revoke_invitation_with_http_info(invitation_id)
      data
    end

    # Revokes an invitation
    # Revokes the given invitation. Revoking an invitation will prevent the user from using the invitation link that was sent to them. However, it doesn&#39;t prevent the user from signing up if they follow the sign up flow. Only active (i.e. non-revoked) invitations can be revoked.
    # @param invitation_id [String] The ID of the invitation to be revoked
    # @return [Array<(RevokeInvitation200Response, Integer, Hash)>] RevokeInvitation200Response data, response status code and response headers
    def revoke_invitation_with_http_info(invitation_id : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: InvitationsApi.revoke_invitation ..."}
      end
      # verify the required parameter "invitation_id" is set
      if @api_client.config.client_side_validation && invitation_id.nil?
        raise ArgumentError.new("Missing the required parameter 'invitation_id' when calling InvitationsApi.revoke_invitation")
      end
      # resource path
      local_var_path = "/invitations/{invitation_id}/revoke".sub("{" + "invitation_id" + "}", URI.encode_path(invitation_id.to_s))

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
      return_type = "RevokeInvitation200Response"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"InvitationsApi.revoke_invitation",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: InvitationsApi#revoke_invitation\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return RevokeInvitation200Response.from_json(data), status_code, headers
    end
  end
end
