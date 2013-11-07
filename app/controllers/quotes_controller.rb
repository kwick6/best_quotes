class QuotesController < Rulers::Controller
  def a_quote
    render :a_quote, :noun => :winking
  end

  def show
    quote = FileModel.find(params["id"])
    ua = request.user_agent
    render_response :quote, :obj => quote, :ua => ua
  end

  def index
    quotes = FileModel.all
    render :index, :quotes => quotes
  end

  def update_quote
    attrs = { "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }
    m = FileModel.save attrs
    render :quote, :obj => m
  end

  def new_quote
    attrs = { "submitter" => "web user",
      "quote" => "A picture is worth a thousand pixels",
      "attribution" => "Me"
    }
    m = FileModel.create attrs
    render :quote, :obj => m
  end

  def quote_1
    quote_1 = Rulers::Model::FileModel.find(1)
    render :quote, :obj => quote_1
  end

  def exception
    raise "It's a bad one!"
  end
end
