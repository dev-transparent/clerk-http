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
  class EmailSMSTemplatesApi
    property api_client : ApiClient

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Retrieve a template
    # Returns the details of a template
    # @param template_type [String] The type of templates to retrieve (email or SMS)
    # @param slug [String] The slug (i.e. machine-friendly name) of the template to retrieve
    # @return [Template]
    def get_template(template_type : String, slug : String)
      data, _status_code, _headers = get_template_with_http_info(template_type, slug)
      data
    end

    # Retrieve a template
    # Returns the details of a template
    # @param template_type [String] The type of templates to retrieve (email or SMS)
    # @param slug [String] The slug (i.e. machine-friendly name) of the template to retrieve
    # @return [Array<(Template, Integer, Hash)>] Template data, response status code and response headers
    def get_template_with_http_info(template_type : String, slug : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: EmailSMSTemplatesApi.get_template ..."}
      end
      # verify the required parameter "template_type" is set
      if @api_client.config.client_side_validation && template_type.nil?
        raise ArgumentError.new("Missing the required parameter 'template_type' when calling EmailSMSTemplatesApi.get_template")
      end
      # verify enum value
      allowable_values = ["email", "sms"]
      if @api_client.config.client_side_validation && !allowable_values.includes?(template_type)
        raise ArgumentError.new("invalid value for \"template_type\", must be one of #{allowable_values}")
      end
      # verify the required parameter "slug" is set
      if @api_client.config.client_side_validation && slug.nil?
        raise ArgumentError.new("Missing the required parameter 'slug' when calling EmailSMSTemplatesApi.get_template")
      end
      # resource path
      local_var_path = "/templates/{template_type}/{slug}".sub("{" + "template_type" + "}", URI.encode_path(template_type.to_s)).sub("{" + "slug" + "}", URI.encode_path(slug.to_s))

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
      return_type = "Template"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"EmailSMSTemplatesApi.get_template",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: EmailSMSTemplatesApi#get_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Template.from_json(data), status_code, headers
    end

    # List all templates
    # Returns a list of all templates. The templates are returned sorted by position.
    # @param template_type [String] The type of templates to list (email or SMS)
    # @return [Array(Template)]
    def get_template_list(template_type : String, paginated : Bool?, limit : Int32?, offset : Int32?)
      data, _status_code, _headers = get_template_list_with_http_info(template_type, paginated, limit, offset)
      data
    end

    # List all templates
    # Returns a list of all templates. The templates are returned sorted by position.
    # @param template_type [String] The type of templates to list (email or SMS)
    # @return [Array<(Array(Template), Integer, Hash)>] Array(Template) data, response status code and response headers
    def get_template_list_with_http_info(template_type : String, paginated : Bool?, limit : Int32?, offset : Int32?)
      if @api_client.config.debugging
        Log.debug {"Calling API: EmailSMSTemplatesApi.get_template_list ..."}
      end
      # verify the required parameter "template_type" is set
      if @api_client.config.client_side_validation && template_type.nil?
        raise ArgumentError.new("Missing the required parameter 'template_type' when calling EmailSMSTemplatesApi.get_template_list")
      end
      # verify enum value
      allowable_values = ["email", "sms"]
      if @api_client.config.client_side_validation && !allowable_values.includes?(template_type)
        raise ArgumentError.new("invalid value for \"template_type\", must be one of #{allowable_values}")
      end
      if @api_client.config.client_side_validation && !limit.nil? && limit > 500
        raise ArgumentError.new("invalid value for \"limit\" when calling EmailSMSTemplatesApi.get_template_list, must be smaller than or equal to 500.")
      end

      if @api_client.config.client_side_validation && !limit.nil? && limit < 1
        raise ArgumentError.new("invalid value for \"limit\" when calling EmailSMSTemplatesApi.get_template_list, must be greater than or equal to 1.")
      end

      if @api_client.config.client_side_validation && !offset.nil? && offset < 0
        raise ArgumentError.new("invalid value for \"offset\" when calling EmailSMSTemplatesApi.get_template_list, must be greater than or equal to 0.")
      end

      # resource path
      local_var_path = "/templates/{template_type}".sub("{" + "template_type" + "}", URI.encode_path(template_type.to_s))

      # query parameters
      query_params = Hash(String, String).new
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
      return_type = "Array(Template)"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:GET,
                                                        local_var_path,
                                                        :"EmailSMSTemplatesApi.get_template_list",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: EmailSMSTemplatesApi#get_template_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Array(Template).from_json(data), status_code, headers
    end

    # Preview changes to a template
    # Returns a preview of a template for a given template_type, slug and body
    # @param template_type [String] The type of template to preview
    # @param slug [String] The slug of the template to preview
    # @return [Object]
    def preview_template(template_type : String, slug : String, preview_template_request : PreviewTemplateRequest?)
      data, _status_code, _headers = preview_template_with_http_info(template_type, slug, preview_template_request)
      data
    end

    # Preview changes to a template
    # Returns a preview of a template for a given template_type, slug and body
    # @param template_type [String] The type of template to preview
    # @param slug [String] The slug of the template to preview
    # @return [Array<(Object, Integer, Hash)>] Object data, response status code and response headers
    def preview_template_with_http_info(template_type : String, slug : String, preview_template_request : PreviewTemplateRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: EmailSMSTemplatesApi.preview_template ..."}
      end
      # verify the required parameter "template_type" is set
      if @api_client.config.client_side_validation && template_type.nil?
        raise ArgumentError.new("Missing the required parameter 'template_type' when calling EmailSMSTemplatesApi.preview_template")
      end
      # verify the required parameter "slug" is set
      if @api_client.config.client_side_validation && slug.nil?
        raise ArgumentError.new("Missing the required parameter 'slug' when calling EmailSMSTemplatesApi.preview_template")
      end
      # resource path
      local_var_path = "/templates/{template_type}/{slug}/preview".sub("{" + "template_type" + "}", URI.encode_path(template_type.to_s)).sub("{" + "slug" + "}", URI.encode_path(slug.to_s))

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
      post_body = preview_template_request.to_json

      # return_type
      return_type = "Object"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"EmailSMSTemplatesApi.preview_template",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: EmailSMSTemplatesApi#preview_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Object.from_json(data), status_code, headers
    end

    # Revert a template
    # Reverts an updated template to its default state
    # @param template_type [String] The type of template to revert
    # @param slug [String] The slug of the template to revert
    # @return [Template]
    def revert_template(template_type : String, slug : String)
      data, _status_code, _headers = revert_template_with_http_info(template_type, slug)
      data
    end

    # Revert a template
    # Reverts an updated template to its default state
    # @param template_type [String] The type of template to revert
    # @param slug [String] The slug of the template to revert
    # @return [Array<(Template, Integer, Hash)>] Template data, response status code and response headers
    def revert_template_with_http_info(template_type : String, slug : String)
      if @api_client.config.debugging
        Log.debug {"Calling API: EmailSMSTemplatesApi.revert_template ..."}
      end
      # verify the required parameter "template_type" is set
      if @api_client.config.client_side_validation && template_type.nil?
        raise ArgumentError.new("Missing the required parameter 'template_type' when calling EmailSMSTemplatesApi.revert_template")
      end
      # verify enum value
      allowable_values = ["email", "sms"]
      if @api_client.config.client_side_validation && !allowable_values.includes?(template_type)
        raise ArgumentError.new("invalid value for \"template_type\", must be one of #{allowable_values}")
      end
      # verify the required parameter "slug" is set
      if @api_client.config.client_side_validation && slug.nil?
        raise ArgumentError.new("Missing the required parameter 'slug' when calling EmailSMSTemplatesApi.revert_template")
      end
      # resource path
      local_var_path = "/templates/{template_type}/{slug}/revert".sub("{" + "template_type" + "}", URI.encode_path(template_type.to_s)).sub("{" + "slug" + "}", URI.encode_path(slug.to_s))

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
      return_type = "Template"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"EmailSMSTemplatesApi.revert_template",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: EmailSMSTemplatesApi#revert_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Template.from_json(data), status_code, headers
    end

    # Toggle the delivery by Clerk for a template of a given type and slug
    # Toggles the delivery by Clerk for a template of a given type and slug. If disabled, Clerk will not deliver the resulting email or SMS. The app developer will need to listen to the `email.created` or `sms.created` webhooks in order to handle delivery themselves.
    # @param template_type [String] The type of template to toggle delivery for
    # @param slug [String] The slug of the template for which to toggle delivery
    # @return [Template]
    def toggle_template_delivery(template_type : String, slug : String, toggle_template_delivery_request : ToggleTemplateDeliveryRequest?)
      data, _status_code, _headers = toggle_template_delivery_with_http_info(template_type, slug, toggle_template_delivery_request)
      data
    end

    # Toggle the delivery by Clerk for a template of a given type and slug
    # Toggles the delivery by Clerk for a template of a given type and slug. If disabled, Clerk will not deliver the resulting email or SMS. The app developer will need to listen to the &#x60;email.created&#x60; or &#x60;sms.created&#x60; webhooks in order to handle delivery themselves.
    # @param template_type [String] The type of template to toggle delivery for
    # @param slug [String] The slug of the template for which to toggle delivery
    # @return [Array<(Template, Integer, Hash)>] Template data, response status code and response headers
    def toggle_template_delivery_with_http_info(template_type : String, slug : String, toggle_template_delivery_request : ToggleTemplateDeliveryRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: EmailSMSTemplatesApi.toggle_template_delivery ..."}
      end
      # verify the required parameter "template_type" is set
      if @api_client.config.client_side_validation && template_type.nil?
        raise ArgumentError.new("Missing the required parameter 'template_type' when calling EmailSMSTemplatesApi.toggle_template_delivery")
      end
      # verify enum value
      allowable_values = ["email", "sms"]
      if @api_client.config.client_side_validation && !allowable_values.includes?(template_type)
        raise ArgumentError.new("invalid value for \"template_type\", must be one of #{allowable_values}")
      end
      # verify the required parameter "slug" is set
      if @api_client.config.client_side_validation && slug.nil?
        raise ArgumentError.new("Missing the required parameter 'slug' when calling EmailSMSTemplatesApi.toggle_template_delivery")
      end
      # resource path
      local_var_path = "/templates/{template_type}/{slug}/toggle_delivery".sub("{" + "template_type" + "}", URI.encode_path(template_type.to_s)).sub("{" + "slug" + "}", URI.encode_path(slug.to_s))

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
      post_body = toggle_template_delivery_request.to_json

      # return_type
      return_type = "Template"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:POST,
                                                        local_var_path,
                                                        :"EmailSMSTemplatesApi.toggle_template_delivery",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: EmailSMSTemplatesApi#toggle_template_delivery\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Template.from_json(data), status_code, headers
    end

    # Update a template for a given type and slug
    # Updates the existing template of the given type and slug
    # @param template_type [String] The type of template to update
    # @param slug [String] The slug of the template to update
    # @return [Template]
    def upsert_template(template_type : String, slug : String, upsert_template_request : UpsertTemplateRequest?)
      data, _status_code, _headers = upsert_template_with_http_info(template_type, slug, upsert_template_request)
      data
    end

    # Update a template for a given type and slug
    # Updates the existing template of the given type and slug
    # @param template_type [String] The type of template to update
    # @param slug [String] The slug of the template to update
    # @return [Array<(Template, Integer, Hash)>] Template data, response status code and response headers
    def upsert_template_with_http_info(template_type : String, slug : String, upsert_template_request : UpsertTemplateRequest?)
      if @api_client.config.debugging
        Log.debug {"Calling API: EmailSMSTemplatesApi.upsert_template ..."}
      end
      # verify the required parameter "template_type" is set
      if @api_client.config.client_side_validation && template_type.nil?
        raise ArgumentError.new("Missing the required parameter 'template_type' when calling EmailSMSTemplatesApi.upsert_template")
      end
      # verify enum value
      allowable_values = ["email", "sms"]
      if @api_client.config.client_side_validation && !allowable_values.includes?(template_type)
        raise ArgumentError.new("invalid value for \"template_type\", must be one of #{allowable_values}")
      end
      # verify the required parameter "slug" is set
      if @api_client.config.client_side_validation && slug.nil?
        raise ArgumentError.new("Missing the required parameter 'slug' when calling EmailSMSTemplatesApi.upsert_template")
      end
      # resource path
      local_var_path = "/templates/{template_type}/{slug}".sub("{" + "template_type" + "}", URI.encode_path(template_type.to_s)).sub("{" + "slug" + "}", URI.encode_path(slug.to_s))

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
      post_body = upsert_template_request.to_json

      # return_type
      return_type = "Template"

      # auth_names
      auth_names = ["bearerAuth"]

      data, status_code, headers = @api_client.call_api(:PUT,
                                                        local_var_path,
                                                        :"EmailSMSTemplatesApi.upsert_template",
                                                        return_type,
                                                        post_body,
                                                        auth_names,
                                                        header_params,
                                                        query_params,
                                                        form_params)
      if @api_client.config.debugging
        Log.debug {"API called: EmailSMSTemplatesApi#upsert_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"}
      end
      return Template.from_json(data), status_code, headers
    end
  end
end
