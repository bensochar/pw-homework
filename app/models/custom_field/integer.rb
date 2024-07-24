module CustomField
  class Integer < Base
    jsonb_accessor :config,
      value: :integer
    validates :value, numericality: { greater_than: 0 }

    def value
      config['value'].to_i
    end
  end
end
