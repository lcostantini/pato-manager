class ResponseDecorator
  def header_task header
    if header.nil?
      ['Name', 'Description', 'Date', 'State']
    else
      header[:header]
    end
  end

  def decorate_table response, header = nil
    Terminal::Table.new rows: response_row(response), headings: header_task(header)
  end

  def response_row(response)
    response.map do |r|
      ["#{ r["name"] }", "#{ r["description"] }", "#{ r["created_at"] }", "#{ r["state"] }"]
    end
  end
end
