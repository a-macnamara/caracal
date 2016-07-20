require 'caracal/core/models/base_model'


module Caracal
  module Core
    module Models
      
      # This class handles block options passed to the page_numbers
      # method.
      #
      class PageNumberModel < BaseModel
        
        #-------------------------------------------------------------
        # Configuration
        #-------------------------------------------------------------
        
        # constants
        const_set(:DEFAULT_PAGE_NUMBER_SHOW,  false)
        const_set(:DEFAULT_PAGE_NUMBER_ALIGN, :center)
        const_set(:DEFAULT_PAGE_NUMBER_IS_CODE, false)
        
        # accessors
        attr_reader :page_number_align
        attr_reader :page_number_show
        attr_reader :page_number_is_code
        
        # initialization
        def initialize(options={}, &block)
          @page_number_show  = DEFAULT_PAGE_NUMBER_SHOW
          @page_number_align = DEFAULT_PAGE_NUMBER_ALIGN
          @page_number_is_code = DEFAULT_PAGE_NUMBER_IS_CODE
          
          super options, &block
        end
        
        
        #-------------------------------------------------------------
        # Public Methods
        #-------------------------------------------------------------
    
        #=============== SETTERS ==============================
        
        def align(value)
          @page_number_align = value.to_s.to_sym
        end
        
        def show(value)
          @page_number_show = !!value
        end
        
        def is_code(value)
          @page_number_is_code = !!value
        end
        
        
        #=============== VALIDATION ===========================
        
        def valid?
          ((!page_number_show || [:left, :center, :right].include?(page_number_align)) || page_number_is_code)
        end
        
        
        #-------------------------------------------------------------
        # Private Instance Methods
        #-------------------------------------------------------------
        private
        
        def option_keys
          [:align, :show, :is_code]
        end
        
      end
      
    end
  end
end