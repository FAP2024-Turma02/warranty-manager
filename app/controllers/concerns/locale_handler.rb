module LocaleHandler
  extend ActiveSupport::Concern

  included do
    before_action :set_locale
  end

  private

  def extract_locale_from_accept_language_header
    if request.env['HTTP_ACCEPT_LANGUAGE']
      language = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}(?:-[A-Z]{2})?/).first
      return language if I18n.available_locales.include?(language&.to_sym)
    end
    nil
  end

  def set_locale
    locale = extract_locale_from_accept_language_header || I18n.default_locale
    Rails.logger.info "Locale set to #{locale}"
    I18n.locale = locale
  end
end
