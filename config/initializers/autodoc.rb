if Rails.env.test?
  Autodoc::Document.class_eval do
    private

    def request_body
      if instance_variable_defined?(:@request_body)
        @request_body
      else
        @request_body = JSON.pretty_generate(request.params.except("controller", "action"))
      end
    end
  end
  Autodoc.configuration.suppressed_response_header +=
    ["X-Request-Id", "X-Runtime", "Content-Length", "ETag"]
  Autodoc.configuration.path = "doc"
  Autodoc.configuration.toc = ENV["TOC"]
  Autodoc.configuration.toc_html = ENV["TOC"]
  Autodoc.configuration.toc_html_template =
    File.read(File.expand_path(Rails.root.join("doc", "toc.html.erb"), __FILE__))
  Autodoc.configuration.toc_template =
    File.read(File.expand_path(Rails.root.join("doc", "toc.md.erb"), __FILE__))
  Autodoc.configuration.template =
    File.read(File.expand_path(Rails.root.join("doc", "document.md.erb"), __FILE__))
  Autodoc.configuration.document_path_from_example = ->(example) do
    example.file_path.gsub(%r{\./spec/controllers/api/(.+)_spec\.rb}, '\1.md')
  end
end