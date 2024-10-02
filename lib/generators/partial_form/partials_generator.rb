module PartialForm
  module Generators
    class PartialsGenerator < Rails::Generators::Base
      SELECTION_GLOBS = {
        default: "_{text_field,label,submit}*.erb",
        all: "*.erb"
      }
      FORM_PARTIALS_PATH = Pathname(__dir__).join("../../../app/views/layouts/form")
      source_root FORM_PARTIALS_PATH
      argument :given_selection, type: :string, optional: true, banner: "SELECTION" # optional because we ask for it if the user does not specify it

      def self.banner #:nodoc:
        <<~BANNER
          rails g partial_form:partials SELECTION [options]

          Copies partial templates to your application.
          You can choose if all partials or only a subset is copied.
          Pick on of: #{SELECTION_GLOBS.keys.join(", ")}
        BANNER
      end

      def validate_selection
        @selection = given_selection
        valid_selections = SELECTION_GLOBS.keys.map(&:to_s)
        unless valid_selections.include?(@selection)
          @selection = ask("Which partials do you wan to copy?", limited_to: valid_selections)
        end
      end

      def copy_partials
        pattern = SELECTION_GLOBS[@selection.to_sym]
        filenames = FORM_PARTIALS_PATH.glob(pattern).map { _1.basename }
        filenames.each do |filename|
          copy_file filename, "app/views/layouts/form/#{filename}"
        end
      end
    end
  end
end
