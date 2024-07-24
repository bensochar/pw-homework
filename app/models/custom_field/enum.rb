module CustomField
  class Enum < Base
    jsonb_accessor :config,
      value: :integer
    validates :value, numericality: { greater_than: 0 }

    def value
      config['options'][config['value'].to_i]
    end
  end
end
