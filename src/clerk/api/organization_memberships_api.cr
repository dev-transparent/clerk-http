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
  class OrganizationMembershipsApi
    property api_client : ApiClient

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Create a new organization membership
    # Adds a user as a member to the given organization. Only users in the same instance as the organization can be added as members.  This organization will be the user's [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don't explicitly set a different organization as active before then.
    # @param organization_id [String] The ID of the organization where the new membership will be created
    # @param create_organization_membership_request [CreateOrganizationMembershipRequest] 
    # @return [OrganizationMembership]
    def create_organization_membership(organization_id : String, create_organization_membership_request : CreateOrganizationMembershipRequest)
      data, _status_code, _headers = create_organization_membership_with_http_info(organization_id, create_organization_membership_request)
      data
    end

    # Create a new organization membership
    # Adds a user as a member to the given organization. Only users in the same instance as the organization can be added as members.  This organization will be the user&#39;s [active organization] (https://clerk.com/docs/organizations/overview#active-organization) the next time they create a session, presuming they don&#39;t explicitly set a different organization as active before then.
    # @param organization_id [String] The ID of the organization where the new membership will be created
    # @param create_organization_membership_request [CreateOrganizationMembershipRequest] 
    # @return [Array<(OrganizationMembership, Integer, Hash)>] OrganizationMembership data, response status code and response headers
    def create_organization_membership_with_http_info(organization_id : String, create_organization_membership_request : CreateOrganizationMembershipRequest)
      if @api_client.config.debugging
        Log.debug {"Calling API: OrganizationMembershipsApi.create_organization_membership ..."}
      end
      # verify the required parameter "organization_id" is set
      if @api_client.config.client_side_validation && organization_id.nil?
        raise ArgumentError.new("Missing the required parameter 'organization_id' when calling OrganizationMembershipsApi.create_organization_membership")
      end
      # verify the required parameter "create_organization_membership_request" is set
      if @api_client.config.client_side_validation && create_organization_membership_request.nil?
        raise ArgumentError.new("Missing the required parameter 'create_organization_membership_request' when calling OrganizationMembershipsApi.create_organization_membership")
      end
      # resource path
      local_var_path = "/organizations/{organization_id}/memberships".sub("{" + "organization_id" + "}", URI.encode_path(organization_id.to_s))

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
      post_body = create_organization_membership_request.to_json

      # return_type
      return_type = "OrganizationMembership"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"OrganizationMembershipsApi.create_organization_membership",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: OrganizationMembershipsApi#create_organization_membership\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return OrganizationMembership.from_json(data), status_code, headers
    end

    # Remove a member from an organization
    # Removes the given membership from the organization
    # @param organization_id [String] The ID of the organization the membership belongs to
    # @param user_id [String] The ID of the user that this membership belongs to
    # @return [OrganizationMembership]
    def delete_organization_membership(organization_id : String, user_id : String)
      data, _status_code, _headers = delete_organization_membership_with_http_info(organization_id, user_id)
      data
    end

    # Remove a member from an organization
    # Removes the given membership from the organization
    # @param organization_id [String] The ID of the organization the membership belongs to
    # @param user_id [String] The ID of the user that this membership belongs to
    # @return [Array<(OrganizationMembership, Integer, Hash)>] OrganizationMembership data, response status code and response headers
    def delete_organization_membership_with_http_info(organization_id : String, user_id : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: OrganizationMembershipsApi.delete_organization_membership ..."}
      end
      # verify the required parameter "organization_id" is set
      if @api_client.config.client_side_validation && organization_id.nil?
        raise ArgumentError.new("Missing the required parameter 'organization_id' when calling OrganizationMembershipsApi.delete_organization_membership")
      end
      # verify the required parameter "user_id" is set
      if @api_client.config.client_side_validation && user_id.nil?
        raise ArgumentError.new("Missing the required parameter 'user_id' when calling OrganizationMembershipsApi.delete_organization_membership")
      end
      # resource path
      local_var_path = "/organizations/{organization_id}/memberships/{user_id}".sub("{" + "organization_id" + "}", URI.encode_path(organization_id.to_s)).sub("{" + "user_id" + "}", URI.encode_path(user_id.to_s))

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
      return_type = "OrganizationMembership"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:DELETE,
                                                        local_var_path,
                                                        :"OrganizationMembershipsApi.delete_organization_membership",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: OrganizationMembershipsApi#delete_organization_membership\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return OrganizationMembership.from_json(data), status_code, headers
    end

    # Get a list of all organization memberships within an instance.
    # Retrieves all organization user memberships for the given instance.
    # @return [OrganizationMemberships]
    def instance_get_organization_memberships(order_by : String?, limit : Int32?, offset : Int32?)
      data, _status_code, _headers = instance_get_organization_memberships_with_http_info(order_by, limit, offset)
      data
    end

    # Get a list of all organization memberships within an instance.
    # Retrieves all organization user memberships for the given instance.
    # @return [Array<(OrganizationMemberships, Integer, Hash)>] OrganizationMemberships data, response status code and response headers
    def instance_get_organization_memberships_with_http_info(order_by : String?, limit : Int32?, offset : Int32?)
      if @api_client.config.debugging
        Log.debug {"Calling API: OrganizationMembershipsApi.instance_get_organization_memberships ..."}
      end
      if @api_client.config.client_side_validation && !limit.nil? && limit > 500
        raise ArgumentError.new("invalid value for \"limit\" when calling OrganizationMembershipsApi.instance_get_organization_memberships, must be smaller than or equal to 500.")
      end

      if @api_client.config.client_side_validation && !limit.nil? && limit < 1
        raise ArgumentError.new("invalid value for \"limit\" when calling OrganizationMembershipsApi.instance_get_organization_memberships, must be greater than or equal to 1.")
      end

      if @api_client.config.client_side_validation && !offset.nil? && offset < 0
        raise ArgumentError.new("invalid value for \"offset\" when calling OrganizationMembershipsApi.instance_get_organization_memberships, must be greater than or equal to 0.")
      end

      # resource path
      local_var_path = "/organization_memberships"

      # query parameters
      query_params = Hash(String, String).new
      query_params["order_by"] = order_by.to_s unless order_by.nil?
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
      return_type = "OrganizationMemberships"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"OrganizationMembershipsApi.instance_get_organization_memberships",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: OrganizationMembershipsApi#instance_get_organization_memberships\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return OrganizationMemberships.from_json(data), status_code, headers
    end

    # Get a list of all members of an organization
    # Retrieves all user memberships for the given organization
    # @param organization_id [String] The organization ID.
    # @return [OrganizationMemberships]
    def list_organization_memberships(organization_id : String, order_by : String?, user_id : Array(String)?, email_address : Array(String)?, phone_number : Array(String)?, username : Array(String)?, web3_wallet : Array(String)?, role : Array(String)?, query : String?, email_address_query : String?, phone_number_query : String?, username_query : String?, name_query : String?, last_active_at_before : Int32?, last_active_at_after : Int32?, created_at_before : Int32?, created_at_after : Int32?, limit : Int32?, offset : Int32?)
      data, _status_code, _headers = list_organization_memberships_with_http_info(organization_id, order_by, user_id, email_address, phone_number, username, web3_wallet, role, query, email_address_query, phone_number_query, username_query, name_query, last_active_at_before, last_active_at_after, created_at_before, created_at_after, limit, offset)
      data
    end

    # Get a list of all members of an organization
    # Retrieves all user memberships for the given organization
    # @param organization_id [String] The organization ID.
    # @return [Array<(OrganizationMemberships, Integer, Hash)>] OrganizationMemberships data, response status code and response headers
    def list_organization_memberships_with_http_info(organization_id : String, order_by : String?, user_id : Array(String)?, email_address : Array(String)?, phone_number : Array(String)?, username : Array(String)?, web3_wallet : Array(String)?, role : Array(String)?, query : String?, email_address_query : String?, phone_number_query : String?, username_query : String?, name_query : String?, last_active_at_before : Int32?, last_active_at_after : Int32?, created_at_before : Int32?, created_at_after : Int32?, limit : Int32?, offset : Int32?)
      if @api_client.config.debugging
        Log.debug {"Calling API: OrganizationMembershipsApi.list_organization_memberships ..."}
      end
      # verify the required parameter "organization_id" is set
      if @api_client.config.client_side_validation && organization_id.nil?
        raise ArgumentError.new("Missing the required parameter 'organization_id' when calling OrganizationMembershipsApi.list_organization_memberships")
      end
      if @api_client.config.client_side_validation && !limit.nil? && limit > 500
        raise ArgumentError.new("invalid value for \"limit\" when calling OrganizationMembershipsApi.list_organization_memberships, must be smaller than or equal to 500.")
      end

      if @api_client.config.client_side_validation && !limit.nil? && limit < 1
        raise ArgumentError.new("invalid value for \"limit\" when calling OrganizationMembershipsApi.list_organization_memberships, must be greater than or equal to 1.")
      end

      if @api_client.config.client_side_validation && !offset.nil? && offset < 0
        raise ArgumentError.new("invalid value for \"offset\" when calling OrganizationMembershipsApi.list_organization_memberships, must be greater than or equal to 0.")
      end

      # resource path
      local_var_path = "/organizations/{organization_id}/memberships".sub("{" + "organization_id" + "}", URI.encode_path(organization_id.to_s))

      # query parameters
      query_params = Hash(String, String).new
      query_params["order_by"] = order_by.to_s unless order_by.nil?
      query_params["user_id"] = @api_client.build_collection_param(user_id, :multi)
      query_params["email_address"] = @api_client.build_collection_param(email_address, :multi)
      query_params["phone_number"] = @api_client.build_collection_param(phone_number, :multi)
      query_params["username"] = @api_client.build_collection_param(username, :multi)
      query_params["web3_wallet"] = @api_client.build_collection_param(web3_wallet, :multi)
      query_params["role"] = @api_client.build_collection_param(role, :multi)
      query_params["query"] = query.to_s unless query.nil?
      query_params["email_address_query"] = email_address_query.to_s unless email_address_query.nil?
      query_params["phone_number_query"] = phone_number_query.to_s unless phone_number_query.nil?
      query_params["username_query"] = username_query.to_s unless username_query.nil?
      query_params["name_query"] = name_query.to_s unless name_query.nil?
      query_params["last_active_at_before"] = last_active_at_before.to_s unless last_active_at_before.nil?
      query_params["last_active_at_after"] = last_active_at_after.to_s unless last_active_at_after.nil?
      query_params["created_at_before"] = created_at_before.to_s unless created_at_before.nil?
      query_params["created_at_after"] = created_at_after.to_s unless created_at_after.nil?
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
      return_type = "OrganizationMemberships"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"OrganizationMembershipsApi.list_organization_memberships",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: OrganizationMembershipsApi#list_organization_memberships\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return OrganizationMemberships.from_json(data), status_code, headers
    end

    # Update an organization membership
    # Updates the properties of an existing organization membership
    # @param organization_id [String] The ID of the organization the membership belongs to
    # @param user_id [String] The ID of the user that this membership belongs to
    # @param update_organization_membership_request [UpdateOrganizationMembershipRequest] 
    # @return [OrganizationMembership]
    def update_organization_membership(organization_id : String, user_id : String, update_organization_membership_request : UpdateOrganizationMembershipRequest)
      data, _status_code, _headers = update_organization_membership_with_http_info(organization_id, user_id, update_organization_membership_request)
      data
    end

    # Update an organization membership
    # Updates the properties of an existing organization membership
    # @param organization_id [String] The ID of the organization the membership belongs to
    # @param user_id [String] The ID of the user that this membership belongs to
    # @param update_organization_membership_request [UpdateOrganizationMembershipRequest] 
    # @return [Array<(OrganizationMembership, Integer, Hash)>] OrganizationMembership data, response status code and response headers
    def update_organization_membership_with_http_info(organization_id : String, user_id : String, update_organization_membership_request : UpdateOrganizationMembershipRequest)
      if @api_client.config.debugging
        Log.debug {"Calling API: OrganizationMembershipsApi.update_organization_membership ..."}
      end
      # verify the required parameter "organization_id" is set
      if @api_client.config.client_side_validation && organization_id.nil?
        raise ArgumentError.new("Missing the required parameter 'organization_id' when calling OrganizationMembershipsApi.update_organization_membership")
      end
      # verify the required parameter "user_id" is set
      if @api_client.config.client_side_validation && user_id.nil?
        raise ArgumentError.new("Missing the required parameter 'user_id' when calling OrganizationMembershipsApi.update_organization_membership")
      end
      # verify the required parameter "update_organization_membership_request" is set
      if @api_client.config.client_side_validation && update_organization_membership_request.nil?
        raise ArgumentError.new("Missing the required parameter 'update_organization_membership_request' when calling OrganizationMembershipsApi.update_organization_membership")
      end
      # resource path
      local_var_path = "/organizations/{organization_id}/memberships/{user_id}".sub("{" + "organization_id" + "}", URI.encode_path(organization_id.to_s)).sub("{" + "user_id" + "}", URI.encode_path(user_id.to_s))

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
      post_body = update_organization_membership_request.to_json

      # return_type
      return_type = "OrganizationMembership"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:PATCH,
                                                        local_var_path,
                                                        :"OrganizationMembershipsApi.update_organization_membership",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: OrganizationMembershipsApi#update_organization_membership\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return OrganizationMembership.from_json(data), status_code, headers
    end

    # Merge and update organization membership metadata
    # Update an organization membership's metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to `null`.
    # @param organization_id [String] The ID of the organization the membership belongs to
    # @param user_id [String] The ID of the user that this membership belongs to
    # @return [OrganizationMembership]
    def update_organization_membership_metadata(organization_id : String, user_id : String, update_organization_membership_metadata_request : UpdateOrganizationMembershipMetadataRequest?)
      data, _status_code, _headers = update_organization_membership_metadata_with_http_info(organization_id, user_id, update_organization_membership_metadata_request)
      data
    end

    # Merge and update organization membership metadata
    # Update an organization membership&#39;s metadata attributes by merging existing values with the provided parameters. Metadata values will be updated via a deep merge. Deep means that any nested JSON objects will be merged as well. You can remove metadata keys at any level by setting their value to &#x60;null&#x60;.
    # @param organization_id [String] The ID of the organization the membership belongs to
    # @param user_id [String] The ID of the user that this membership belongs to
    # @return [Array<(OrganizationMembership, Integer, Hash)>] OrganizationMembership data, response status code and response headers
    def update_organization_membership_metadata_with_http_info(organization_id : String, user_id : String, update_organization_membership_metadata_request : UpdateOrganizationMembershipMetadataRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: OrganizationMembershipsApi.update_organization_membership_metadata ..."}
      end
      # verify the required parameter "organization_id" is set
      if @api_client.config.client_side_validation && organization_id.nil?
        raise ArgumentError.new("Missing the required parameter 'organization_id' when calling OrganizationMembershipsApi.update_organization_membership_metadata")
      end
      # verify the required parameter "user_id" is set
      if @api_client.config.client_side_validation && user_id.nil?
        raise ArgumentError.new("Missing the required parameter 'user_id' when calling OrganizationMembershipsApi.update_organization_membership_metadata")
      end
      # resource path
      local_var_path = "/organizations/{organization_id}/memberships/{user_id}/metadata".sub("{" + "organization_id" + "}", URI.encode_path(organization_id.to_s)).sub("{" + "user_id" + "}", URI.encode_path(user_id.to_s))

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
      post_body = update_organization_membership_metadata_request.to_json

      # return_type
      return_type = "OrganizationMembership"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:PATCH,
                                                        local_var_path,
                                                        :"OrganizationMembershipsApi.update_organization_membership_metadata",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: OrganizationMembershipsApi#update_organization_membership_metadata\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return OrganizationMembership.from_json(data), status_code, headers
    end
  end
end
