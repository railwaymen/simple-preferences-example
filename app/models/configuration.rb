class Configuration < ActiveRecord::Base

  validates_presence_of :setting, :value

  class << self
    
    def get(key = nil)
      key = key.to_s if key.is_a?(Symbol)
      prefs = Rails.cache.fetch(self.to_s) { configurations }

      return prefs if key.nil?
      prefs[key]
    end
    
    def set(new_configurations={})
      stored_configurations = Configuration.all  
      new_configurations.each do |key, value|
        key = key.to_s if key.is_a?(Symbol)
        configuration = stored_configurations.detect {|c| c.setting == key}

        configuration = Configuration.new(:setting => key) if configuration.nil?
        
        configuration.value = value
        
        configuration.save!
      end
      Rails.cache.delete(self.to_s) { configurations }
    end


    alias_method :[], :get
    
    
    private

    def configurations
      all_configurations = {}
      find(:all).each do |configuration|
        all_configurations[configuration.setting] = configuration.value
      end
      all_configurations
    end
    
  end

end
