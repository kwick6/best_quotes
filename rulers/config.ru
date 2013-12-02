use Rack::Auth::Basic, "app" do |_, pass|
105
'secret' == pass
    end
    run proc {
      [200, {'Content-Type' => 'text/html'},
        ["Hello, world!"]]
    }
