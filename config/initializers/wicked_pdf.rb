# From: http://stackoverflow.com/questions/5013955/problem-implementing-wicked-pdf-on-heroku/16577677#16577677

def is_mac?
  (/darwin/ =~ RUBY_PLATFORM) != nil
end

if is_mac?
  # Linux (check your processor for Intel x86 or AMD x64)
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
  # wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-i386"
  # OS X
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-0.9.9-OS-X.i368"
  # Windows
  # wkhtmltopdf_path = 'C:\Program Files/wkhtmltopdf/wkhtmltopdf.exe'
else
  wkhtmltopdf_path = "#{Rails.root}/bin/wkhtmltopdf-amd64"
end

WickedPdf.config = { exe_path: wkhtmltopdf_path, wkhtmltopdf: wkhtmltopdf_path }
