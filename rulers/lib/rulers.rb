require "rulers/version"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"
require "rulers/file_model"

module Rulers
  class Application
    def call(env)
      if env['PATH_INFO'] == '/favicon.ico'
        return [404, {'Content-Type' => 'text/html'}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      text = controller.send(act)
      if controller.get_response
        st, hd, rs = controller.get_response.to_a
        [st, hd, [rs.body].flatten]
      else
        [200, {'Content-Type' => 'text/html'}, [text]]
      end
      # begin
      #   text = controller.send(act)
      # rescue Exception => e
      #   text = "<!doctype html><html><head></head><body>"
      #   text = "Oops! A #{e.class}:#{e.message} exception happened! <br>\n"
      #   text += "<ul>"
      #   e.backtrace.each do |line|
      #     text += "<li>#{line}</li>"
      #   end
      #   text += "</ul></body></html>"
      # end
      # [200, {'Content-Type' => 'text/html'}, [text]]
    end
  end
end
