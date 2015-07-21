module RedmineKaminari::Kaminari::ActionViewExtensionPatch
  extend ActiveSupport::Concern

  included do
    alias_method_chain :paginate, :redmine_patch
    alias_method_chain :page_entries_info, :redmine_patch

    def per_page_tag(scope, options)
      values = per_page_opts(scope.limit_value, scope.total_count)

      if values.any?
        links =
            values.collect do |n|
              if n == scope.limit_value
                content_tag('span', n.to_s)
              else
                link_to(n, url_for(per_page: n, options[:param_name] => nil), remote: options[:remote]).html_safe
              end
            end

        l(:label_display_per_page, links.join(', ')).html_safe
      end
    end

    def per_page_opts(selected=nil, item_count=nil)
      options = Setting.per_page_options_array

      if item_count && options.any?
        max =
            if item_count > options.first
              options.detect {|value| value >= item_count} || item_count
            else
              item_count
            end

        options.select! {|value| value <= max || value == selected}
      end

      if options.empty? || (options.size == 1 && options.first == selected)
        []
      else
        options
      end
    end
  end

  def page_entries_info_with_redmine_patch(scope, options = {})
    first = scope.offset_value + 1
    last = scope.last_page? ? scope.total_count : scope.offset_value + scope.limit_value
    "(#{first}-#{last}/#{scope.total_count})".html_safe
  end

  def paginate_with_redmine_patch(scope, options = {}, &block)
    paginate_without_redmine_patch(scope, options, &block) +
        content_tag('span', class: 'items') do
          page_entries_info(scope, options)
        end + ' '.html_safe +
        content_tag('span', class: 'per-page') do
          per_page_tag(scope, options)
        end
  end

end