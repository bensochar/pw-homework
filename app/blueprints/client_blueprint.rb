class ClientBlueprint < Blueprinter::Base
  fields :name
  field :path do |client|
    Rails.application.routes.url_helpers.client_path(client)
  end
end