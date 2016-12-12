require 'caracal/core/models/header_model'
require 'caracal/core/models/page_code_model'
require 'caracal/errors'


# TODO:
# - header align left, right, center, etc.
# - page number field codes
# - tab separators to show both left-aligned and right-aligned headers on the same row
# - duplicate for footers, with backward compatibility for footers

module Caracal
  module Core
    
    # This module encapsulates all the functionality related to setting the 
    # document's header behavior.
    #
    module Headers
      def self.included(base)
        base.class_eval do
          
          #-------------------------------------------------------------
          # Configuration
          #-------------------------------------------------------------
    
          # constants
          
          # accessors
          attr_reader :header_show
          
          
          #-------------------------------------------------------------
          # Public Methods
          #-------------------------------------------------------------
    
          # This method controls whether and how page numbers are displayed
          # on the document.
          #
          def header(*args, &block)
            options = Caracal::Utilities.extract_options!(args)
            options.merge!({ show: !!args.first }) unless args.first.nil?  # careful: falsey value
            
            model = Caracal::Core::Models::HeaderModel.new(options, &block)
            if model.valid?
              @header_show = model.header_show
              self.toplevel_headers << model
            else
              raise Caracal::Errors::InvalidModelError, 'invalid header!'
            end
          end
          

          #============== GETTERS ==========================
          
          def toplevel_headers
            @toplevel_headers ||= []
          end          
          
        end
      end
    end
    
  end
end