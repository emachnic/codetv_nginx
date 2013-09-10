module RailsthemesHelper
  def error_views
    Dir.glob('app/views/railsthemes_errors/*.html.*').sort
  end

  def grouped_wireframes
    wireframes = Dir.glob('app/views/railsthemes/railsthemes/*.html.*').map do |file|
      File.basename(file).gsub(/\.html\..*$/, '')
    end
    wireframes = wireframes.delete_if do |wireframe|
      wireframe == 'index' || wireframe.match(/^_/)
    end
    groups = wireframes.sort.group_by { |name| name.gsub(/-.*/, "") }
    groups.delete_if do |group|
      %w{ components ecommerce layouts forms }.include?(group)
    end
  end

  def make_title wireframe_name
    shortname = wireframe_name.gsub(/^[a-zA-Z\-_]+-/, "")
    shortname = shortname.titleize
    shortname.gsub(/Jquery Ui/, 'jQuery UI')
  end

  def example_tabs(partial_path, opts = {})
    title = File.basename(partial_path)
    rel   = "#{title.downcase}-source"

    link_opts = {
      :class => 'view-code',
      :rel   => "#{rel}-%s"
    }

    if opts[:modal]
      link_opts[:class] << ' modal'
      link_opts[:reveal_id] = "#{rel}-%s-modal"
    else
      link_opts[:class] << ' tab'
    end

    locals = {
      :title => title,
      :rel => rel,
      :link_opts => link_opts,
      :preview => render(:partial => File.join('railsthemes', 'railsthemes', partial_path)),
      :tag => opts[:tag],
    }.merge(source_code(partial_path, false))

    render(:partial => 'railsthemes/shared/example_tabs', :locals => locals)
  end

  def wrap_line_breaks(haml)
    ActiveSupport::SafeBuffer.new(haml.gsub("\n\n", "<span class=\"line-break\">\n</span>"))
  end

  def source_code(partial_path, render_view = true)
    filename = File.basename(partial_path)
    path     = File.join('railsthemes', 'railsthemes', File.dirname(partial_path))
    coderay_html_options = { :wrap => nil, :break_lines => true, :css => :class }

    html = CodeRay.scan(render(:partial => File.join(path, filename)), :html).
      html(coderay_html_options).html_safe

    examples = {}
    examples[:HTML] = {
      :code => html, :show => true, :linecount => html.split("\n").size
    }

    haml_file = Rails.root.join('app','views', path, "_#{filename}.html.haml")
    if File.exists? haml_file
      haml = CodeRay.scan(File.read(haml_file), :haml).
        html(coderay_html_options).html_safe

      linecount = haml.split("\n").size
      haml = wrap_line_breaks(haml)

      examples[:Haml] = { :code => haml, :linecount => linecount }
    end

    locals = { :examples => examples }

    if render_view
      render(:partial => 'railsthemes/shared/source_code', :locals => locals)
    else
      locals
    end
  end

  def jquery_icon_list
    %w(
      ui-icon-carat-1-n
      ui-icon-carat-1-ne
      ui-icon-carat-1-e
      ui-icon-carat-1-se
      ui-icon-carat-1-s
      ui-icon-carat-1-sw
      ui-icon-carat-1-w
      ui-icon-carat-1-nw
      ui-icon-carat-2-n-s
      ui-icon-carat-2-e-w
      ui-icon-triangle-1-n
      ui-icon-triangle-1-ne
      ui-icon-triangle-1-e
      ui-icon-triangle-1-se
      ui-icon-triangle-1-s
      ui-icon-triangle-1-sw
      ui-icon-triangle-1-w
      ui-icon-triangle-1-nw
      ui-icon-triangle-2-n-s
      ui-icon-triangle-2-e-w
      ui-icon-arrow-1-n
      ui-icon-arrow-1-ne
      ui-icon-arrow-1-e
      ui-icon-arrow-1-se
      ui-icon-arrow-1-s
      ui-icon-arrow-1-sw
      ui-icon-arrow-1-w
      ui-icon-arrow-1-nw
      ui-icon-arrow-2-n-s
      ui-icon-arrow-2-ne-sw
      ui-icon-arrow-2-e-w
      ui-icon-arrow-2-se-nw
      ui-icon-arrowstop-1-n
      ui-icon-arrowstop-1-e
      ui-icon-arrowstop-1-s
      ui-icon-arrowstop-1-w
      ui-icon-arrowthick-1-n
      ui-icon-arrowthick-1-ne
      ui-icon-arrowthick-1-e
      ui-icon-arrowthick-1-se
      ui-icon-arrowthick-1-s
      ui-icon-arrowthick-1-sw
      ui-icon-arrowthick-1-w
      ui-icon-arrowthick-1-nw
      ui-icon-arrowthick-2-n-s
      ui-icon-arrowthick-2-ne-sw
      ui-icon-arrowthick-2-e-w
      ui-icon-arrowthick-2-se-nw
      ui-icon-arrowthickstop-1-n
      ui-icon-arrowthickstop-1-e
      ui-icon-arrowthickstop-1-s
      ui-icon-arrowthickstop-1-w
      ui-icon-arrowreturnthick-1-w
      ui-icon-arrowreturnthick-1-n
      ui-icon-arrowreturnthick-1-e
      ui-icon-arrowreturnthick-1-s
      ui-icon-arrowreturn-1-w
      ui-icon-arrowreturn-1-n
      ui-icon-arrowreturn-1-e
      ui-icon-arrowreturn-1-s
      ui-icon-arrowrefresh-1-w
      ui-icon-arrowrefresh-1-n
      ui-icon-arrowrefresh-1-e
      ui-icon-arrowrefresh-1-s
      ui-icon-arrow-4
      ui-icon-arrow-4-diag
      ui-icon-extlink
      ui-icon-newwin
      ui-icon-refresh
      ui-icon-shuffle
      ui-icon-transfer-e-w
      ui-icon-transferthick-e-w
      ui-icon-folder-collapsed
      ui-icon-folder-open
      ui-icon-document
      ui-icon-document-b
      ui-icon-note
      ui-icon-mail-closed
      ui-icon-mail-open
      ui-icon-suitcase
      ui-icon-comment
      ui-icon-person
      ui-icon-print
      ui-icon-trash
      ui-icon-locked
      ui-icon-unlocked
      ui-icon-bookmark
      ui-icon-tag
      ui-icon-home
      ui-icon-flag
      ui-icon-calculator
      ui-icon-cart
      ui-icon-pencil
      ui-icon-clock
      ui-icon-disk
      ui-icon-calendar
      ui-icon-zoomin
      ui-icon-zoomout
      ui-icon-search
      ui-icon-wrench
      ui-icon-gear
      ui-icon-heart
      ui-icon-star
      ui-icon-link
      ui-icon-cancel
      ui-icon-plus
      ui-icon-plusthick
      ui-icon-minus
      ui-icon-minusthick
      ui-icon-close
      ui-icon-closethick
      ui-icon-key
      ui-icon-lightbulb
      ui-icon-scissors
      ui-icon-clipboard
      ui-icon-copy
      ui-icon-contact
      ui-icon-image
      ui-icon-video
      ui-icon-script
      ui-icon-alert
      ui-icon-info
      ui-icon-notice
      ui-icon-help
      ui-icon-check
      ui-icon-bullet
      ui-icon-radio-off
      ui-icon-radio-on
      ui-icon-pin-w
      ui-icon-pin-s
      ui-icon-play
      ui-icon-pause
      ui-icon-seek-next
      ui-icon-seek-prev
      ui-icon-seek-end
      ui-icon-seek-first
      ui-icon-stop
      ui-icon-eject
      ui-icon-volume-off
      ui-icon-volume-on
      ui-icon-power
      ui-icon-signal-diag
      ui-icon-signal
      ui-icon-battery-0
      ui-icon-battery-1
      ui-icon-battery-2
      ui-icon-battery-3
      ui-icon-circle-plus
      ui-icon-circle-minus
      ui-icon-circle-close
      ui-icon-circle-triangle-e
      ui-icon-circle-triangle-s
      ui-icon-circle-triangle-w
      ui-icon-circle-triangle-n
      ui-icon-circle-arrow-e
      ui-icon-circle-arrow-s
      ui-icon-circle-arrow-w
      ui-icon-circle-arrow-n
      ui-icon-circle-zoomin
      ui-icon-circle-zoomout
      ui-icon-circle-check
      ui-icon-circlesmall-plus
      ui-icon-circlesmall-minus
      ui-icon-circlesmall-close
      ui-icon-squaresmall-plus
      ui-icon-squaresmall-minus
      ui-icon-squaresmall-close
      ui-icon-grip-dotted-vertical
      ui-icon-grip-dotted-horizontal
      ui-icon-grip-solid-vertical
      ui-icon-grip-solid-horizontal
      ui-icon-gripsmall-diagonal-se
      ui-icon-grip-diagonal-se
    )
  end

  def lorem(words)
    paragraph = <<-EOS
      Lorem ipsum dolor sit amet, consectetur adipiscing elit.
      Pellentesque volutpat faucibus odio, at vestibulum nunc tristique sit amet.
      Morbi orci purus, congue vitae scelerisque sit amet, molestie sit amet massa.
      Praesent sed purus lacinia, convallis est at, porta lorem.
      Vivamus ut vestibulum odio.
      Nunc consequat erat eget erat pretium, eu dapibus orci rhoncus.
      Suspendisse nec lorem orci.
      Cras feugiat libero nec augue consectetur, et porttitor sapien tristique.
      Proin venenatis libero eget congue pharetra.
      Nulla non consequat nisl, ut tincidunt metus.
      Donec sit amet justo quam.
      Donec aliquet sapien ut quam vehicula, et consectetur justo porttitor.
      Sed mattis, mi iaculis venenatis.
    EOS
    selection = paragraph.split(/\s+/, words+1)[0...words].join(' ')
    return selection if selection.end_with?(".")
    return selection.chop! << '.' if selection.end_with?(",")
    selection << '.'
  end
end
