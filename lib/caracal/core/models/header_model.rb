require 'caracal/core/models/base_model'


module Caracal
  module Core
    module Models
      
      # This class handles block options passed to the header
      # method.
      #
      class HeaderModel < ParagraphModel
        
        #-------------------------------------------------------------
        # Configuration
        #-------------------------------------------------------------
        
        # constants
        const_set(:DEFAULT_HEADER_SHOW,  false)
        
        # accessors
        attr_reader :header_show
        
        # initialization
        def initialize(options={}, &block)
          @header_show  = DEFAULT_HEADER_SHOW
          
          super options, &block
        end
        
        
        #-------------------------------------------------------------
        # Public Methods
        #-------------------------------------------------------------
    
        #=============== SETTERS ==============================
        
        def show(value)
          @header_show = !!value
        end
        
        
        #=============== SUB-METHODS ===========================
        
        def page # paragraph model method that shouldn't work for headers
          raise Caracal::Errors::InvalidModelError, 'page not supported in headers.'
        end
        
        
        #=============== VALIDATION ===========================
        
        def valid?
          # make sure model is valid with all inputs etc.
          true
        end
        
        
        #-------------------------------------------------------------
        # Private Instance Methods
        #-------------------------------------------------------------
        private
        
        def option_keys
          [:show]
        end
        
      end
      
    end
  end
end