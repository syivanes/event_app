Geocoder.configure(
  :timeout => 130
)
if %w(development test).include? Rails.env
  module Geocoder
    module Request
      def geocoder_spoofable_ip_with_localhost_override
        ip_candidate = geocoder_spoofable_ip_without_localhost_override
        if ip_candidate == '127.0.0.1'
          '107.128.188.218'
        else
          ip_candidate
        end
      end
      alias_method_chain :geocoder_spoofable_ip, :localhost_override
    end
  end
end


