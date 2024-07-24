module CustomField
  class Base < ApplicationRecord
    self.table_name = :custom_fields
    belongs_to :client
    jsonb_accessor :config,
      name: :string,
      value: :string

    validates :type, :client, presence: true

    def label
      config['name'].humanize
    end
  end
end
