module CustomField
  class Base < ApplicationRecord
    self.table_name = :custom_fields
    # attribute :name, :string
    # attribute :label, :string
    attr_accessor :value, :name
    belongs_to :client
    # serialize :config, JsonbSerializers
     # Text, Integer, etc.
    validates :type, :client, presence: true


    def name
      config['name']
    end

    def value
      config['value']
    end

    def value=(value)
      config['value'] = value
    end

    def label
      config['name'].humanize
    end
  end
end
