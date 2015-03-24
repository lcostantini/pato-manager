class ResponseDecorator
  def decorate_table response
    Terminal::Table.new rows: response_row(response),
      headings: ['Name', 'Description', 'Date', 'State', 'Category']
  end

  def response_row response
    response.map do |r|
      ["#{ r["name"] }", "#{ r["description"] }", "#{ r["created_at"] }", "#{ r["state"] }", "#{ r["category"] }"]
    end
  end
end
