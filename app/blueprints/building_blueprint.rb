class BuildingBlueprint < Blueprinter::Base
  fields :id, :street_address, :city, :state, :postcode, :country
  field :path do |building|
    Rails.application.routes.url_helpers.building_path(building)
  end
  association :client, blueprint: ClientBlueprint, name: :client
  association :custom_fields, blueprint: CustomFieldBlueprint, name: :fields
end