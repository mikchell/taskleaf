require "uri"

module ApplicationHelper
  def linked_task_description(description)
    formatted_description = simple_format(h(description), {}, sanitize: false, wrapper_tag: "div")

    formatted_description.gsub(URI::DEFAULT_PARSER.make_regexp(%w[http https])) do |url|
      link_to(url, url, target: "_blank", rel: "noopener")
    end.html_safe
  end
end
