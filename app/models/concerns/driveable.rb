# app/models/concerns/drievable.rb
# notice that the file name has to match the module name 
# (applying Rails conventions for autoloading)
module Driveable
  extend ActiveSupport::Concern
  require 'google/api_client'
  require 'rubygems'
  require "google_drive"

  ##
    # Copy an existing file
    #
    # @param [Google::APIClient] client
    #   Authorized client instance
    # @param [String] origin_file_id
    #   ID of the origin file to copy
    # @param [String] copy_title
    #   Title of the copy
    # @return [Google::APIClient::Schema::Drive::V2::File]
    #   The copied file if successful, nil otherwise
    def copy_file(client, origin_file_id, copy_title, field)
      drive = client.discovered_api('drive', 'v2')
      copied_file = drive.files.copy.request_schema.new({
        'title' => copy_title
      })
      result = client.execute(
        :api_method => drive.files.copy,
        :body_object => copied_file,
        :parameters => { 'fileId' => origin_file_id })
      if result.status == 200
        return result.data #tengo que sacar el link de aqui pa ponerlo en la base de datos
      else
        puts "An error occurred: #{result.data['error']['message']}"
      end
    end

    ##
    # Insert a new permission
    #
    # @param [Google::APIClient] client
    #   Authorized client instance
    # @param [String] file_id
    #   ID of the file to insert permission for.
    # @param [String] value
    #   User or group e-mail address, domain name or nil for 'default' type
    # @param [String] perm_type
    #   The value 'user', 'group', 'domain' or 'default'
    # @param [String] role
    #   The value 'owner', 'writer' or 'reader'
    # @return [Google::APIClient::Schema::Drive::V2::Permission]
    #   The inserted permission if successful, nil otherwise
    def insert_permission(client, file_id, value, perm_type, role)

      drive = client.discovered_api('drive', 'v2')
      new_permission = drive.permissions.insert.request_schema.new({
        'value' => value,
        'type' => perm_type,
        'role' => role
      })
      result = client.execute(
        :api_method => drive.permissions.insert,
        :body_object => new_permission,
        :parameters => { 'fileId' => file_id })
      if result.status == 200
        return result.data
      else
        puts "An error occurred: #{result.data['error']['message']}"
      end
    end
end