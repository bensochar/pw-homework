module CustomField
  class Enum < Base
    # attribute :value, :integer
    # validates :value, numericality: { greater_than: 0 }

    def value
      config['options'][config['value'].to_i]
    end
  end
end
