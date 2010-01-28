# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{actionmailer}
  s.version = "2.3.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["David Heinemeier Hansson"]
  s.autorequire = %q{action_mailer}
  s.date = %q{2009-11-26}
  s.description = %q{Makes it trivial to test and deliver emails sent from a single service layer.}
  s.email = %q{david@loudthinking.com}
  s.files = ["Rakefile", "install.rb", "README", "CHANGELOG", "MIT-LICENSE", "lib/action_mailer/adv_attr_accessor.rb", "lib/action_mailer/base.rb", "lib/action_mailer/helpers.rb", "lib/action_mailer/mail_helper.rb", "lib/action_mailer/part.rb", "lib/action_mailer/part_container.rb", "lib/action_mailer/quoting.rb", "lib/action_mailer/test_case.rb", "lib/action_mailer/test_helper.rb", "lib/action_mailer/utils.rb", "lib/action_mailer/vendor/text-format-0.6.3/text/format.rb", "lib/action_mailer/vendor/text_format.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/address.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/attachments.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/base64.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/compat.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/config.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/core_extensions.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/encode.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/header.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/index.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/interface.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/loader.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/mail.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/mailbox.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/main.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/mbox.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/net.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/obsolete.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/parser.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/port.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/quoting.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/require_arch.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/scanner.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/scanner_r.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/stringio.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/utils.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail/version.rb", "lib/action_mailer/vendor/tmail-1.2.3/tmail.rb", "lib/action_mailer/vendor/tmail.rb", "lib/action_mailer/version.rb", "lib/action_mailer.rb", "lib/actionmailer.rb", "test/abstract_unit.rb", "test/asset_host_test.rb", "test/delivery_method_test.rb", "test/fixtures/asset_host_mailer/email_with_asset.html.erb", "test/fixtures/auto_layout_mailer/hello.html.erb", "test/fixtures/auto_layout_mailer/multipart.text.html.erb", "test/fixtures/auto_layout_mailer/multipart.text.plain.erb", "test/fixtures/explicit_layout_mailer/logout.html.erb", "test/fixtures/explicit_layout_mailer/signup.html.erb", "test/fixtures/first_mailer/share.erb", "test/fixtures/helper_mailer/use_example_helper.erb", "test/fixtures/helper_mailer/use_helper.erb", "test/fixtures/helper_mailer/use_helper_method.erb", "test/fixtures/helper_mailer/use_mail_helper.erb", "test/fixtures/helpers/example_helper.rb", "test/fixtures/layouts/auto_layout_mailer.html.erb", "test/fixtures/layouts/auto_layout_mailer.text.erb", "test/fixtures/layouts/spam.html.erb", "test/fixtures/path.with.dots/funky_path_mailer/multipart_with_template_path_with_dots.erb", "test/fixtures/raw_email", "test/fixtures/raw_email10", "test/fixtures/raw_email12", "test/fixtures/raw_email13", "test/fixtures/raw_email2", "test/fixtures/raw_email3", "test/fixtures/raw_email4", "test/fixtures/raw_email5", "test/fixtures/raw_email6", "test/fixtures/raw_email7", "test/fixtures/raw_email8", "test/fixtures/raw_email9", "test/fixtures/raw_email_quoted_with_0d0a", "test/fixtures/raw_email_with_invalid_characters_in_content_type", "test/fixtures/raw_email_with_nested_attachment", "test/fixtures/raw_email_with_partially_quoted_subject", "test/fixtures/second_mailer/share.erb", "test/fixtures/templates/signed_up.erb", "test/fixtures/test_mailer/_subtemplate.text.plain.erb", "test/fixtures/test_mailer/body_ivar.erb", "test/fixtures/test_mailer/custom_templating_extension.text.html.haml", "test/fixtures/test_mailer/custom_templating_extension.text.plain.haml", "test/fixtures/test_mailer/implicitly_multipart_example.ignored.erb", "test/fixtures/test_mailer/implicitly_multipart_example.rhtml.bak", "test/fixtures/test_mailer/implicitly_multipart_example.text.html.erb", "test/fixtures/test_mailer/implicitly_multipart_example.text.html.erb~", "test/fixtures/test_mailer/implicitly_multipart_example.text.plain.erb", "test/fixtures/test_mailer/implicitly_multipart_example.text.yaml.erb", "test/fixtures/test_mailer/included_subtemplate.text.plain.erb", "test/fixtures/test_mailer/rxml_template.builder", "test/fixtures/test_mailer/rxml_template.rxml", "test/fixtures/test_mailer/signed_up.html.erb", "test/fixtures/test_mailer/signed_up_with_url.erb", "test/mail_helper_test.rb", "test/mail_layout_test.rb", "test/mail_render_test.rb", "test/mail_service_test.rb", "test/quoting_test.rb", "test/test_helper_test.rb", "test/tmail_test.rb", "test/url_test.rb"]
  s.homepage = %q{http://www.rubyonrails.org}
  s.require_paths = ["lib"]
  s.requirements = ["none"]
  s.rubyforge_project = %q{actionmailer}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Service layer for easy email delivery and testing.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<actionpack>, ["= 2.3.5"])
    else
      s.add_dependency(%q<actionpack>, ["= 2.3.5"])
    end
  else
    s.add_dependency(%q<actionpack>, ["= 2.3.5"])
  end
end
