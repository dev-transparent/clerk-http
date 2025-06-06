# #Clerk Backend API
#
##The Clerk REST Backend API, meant to be accessed by backend servers.  ### Versions  When the API changes in a way that isn't compatible with older versions, a new version is released. Each version is identified by its release date, e.g. `2025-03-12`. For more information, please see [Clerk API Versions](https://clerk.com/docs/versioning/available-versions).  Please see https://clerk.com/docs for more information.
#
#The version of the OpenAPI document: 2025-03-12
#Contact: support@clerk.com
#Generated by: https://openapi-generator.tech
#Generator version: 7.12.0
#

require "big"
require "json"
require "time"

module Clerk
  class CreateOrganizationInvitationRequest
    include JSON::Serializable

    # Required properties
    # The email address of the new member that is going to be invited to the organization
    @[JSON::Field(key: "email_address", type: String, nillable: false, emit_null: false)]
    property email_address : String

    # The role of the new member in the organization
    @[JSON::Field(key: "role", type: String, nillable: false, emit_null: false)]
    property role : String

    # Optional properties
    # The ID of the user that invites the new member to the organization. Must be an administrator in the organization.
    @[JSON::Field(key: "inviter_user_id", type: String?, nillable: true, emit_null: false)]
    property inviter_user_id : String?

    # Metadata saved on the organization invitation, read-only from the Frontend API and fully accessible (read/write) from the Backend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
    @[JSON::Field(key: "public_metadata", type: Hash(String, Object)?, nillable: true, emit_null: false)]
    property public_metadata : Hash(String, Object)?

    # Metadata saved on the organization invitation, fully accessible (read/write) from the Backend API but not visible from the Frontend API. When the organization invitation is accepted, the metadata will be transferred to the newly created organization membership.
    @[JSON::Field(key: "private_metadata", type: Hash(String, Object)?, nillable: true, emit_null: false)]
    property private_metadata : Hash(String, Object)?

    # Optional URL that the invitee will be redirected to once they accept the invitation by clicking the join link in the invitation email.
    @[JSON::Field(key: "redirect_url", type: String?, nillable: true, emit_null: false)]
    property redirect_url : String?

    # The number of days the invitation will be valid for. By default, the invitation has a 30 days expire.
    @[JSON::Field(key: "expires_in_days", type: Int32?, nillable: true, emit_null: false)]
    property expires_in_days : Int32?

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(@email_address : String, @role : String, @inviter_user_id : String?, @public_metadata : Hash(String, Object)?, @private_metadata : Hash(String, Object)?, @redirect_url : String?, @expires_in_days : Int32?)
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array(String).new
      if !@expires_in_days.nil? && @expires_in_days > 365
        invalid_properties.push("invalid value for \"expires_in_days\", must be smaller than or equal to 365.")
      end

      if !@expires_in_days.nil? && @expires_in_days < 1
        invalid_properties.push("invalid value for \"expires_in_days\", must be greater than or equal to 1.")
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@expires_in_days.nil? && @expires_in_days > 365
      return false if !@expires_in_days.nil? && @expires_in_days < 1
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] expires_in_days Value to be assigned
    def expires_in_days=(expires_in_days)
      if !expires_in_days.nil? && expires_in_days > 365
        raise ArgumentError.new("invalid value for \"expires_in_days\", must be smaller than or equal to 365.")
      end

      if !expires_in_days.nil? && expires_in_days < 1
        raise ArgumentError.new("invalid value for \"expires_in_days\", must be greater than or equal to 1.")
      end

      @expires_in_days = expires_in_days
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.same?(o)
      self.class == o.class &&
          email_address == o.email_address &&
          inviter_user_id == o.inviter_user_id &&
          role == o.role &&
          public_metadata == o.public_metadata &&
          private_metadata == o.private_metadata &&
          redirect_url == o.redirect_url &&
          expires_in_days == o.expires_in_days
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [email_address, inviter_user_id, role, public_metadata, private_metadata, redirect_url, expires_in_days].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if !attributes[self.class.attribute_map[key]]? && self.class.openapi_nullable.includes?(key)
          self.send("#{key}=", nil)
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        ({} of Symbol => String).tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Clerk.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {} of Symbol => String
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.includes?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        ({} of Symbol => String).tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
