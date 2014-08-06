module Spree
  Variant.class_eval do
    translates :name, :description, :fallbacks_for_empty_translations => true
    include SpreeI18n::Translatable

    def duplicate_extra(old_variant)
      duplicate_translations(old_variant)
    end

    private

    def duplicate_translations(old_variant)
      old_variant.translations.each do |translation|
        self.translations << translation.dup
      end
    end
  end
end
