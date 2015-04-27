class ResponseDecorator
  def decorate_table response, options = {}
    @response = response
    @options = options
    return '# The list is empty' if response.empty?
    Terminal::Table.new headings: get_header, rows: get_rows
  end

  private

  def default_rows
    @response.map do |r|
      ["#{ r[:id] }",
       "#{ r[:name] }",
       "#{ icon_state(r[:state]) }",
       "#{ r[:category] }"]
    end
  end

  def get_header
    head = ['Id', 'Name', 'State', 'Category']
    head << 'Date' if @options[:date]
    head << 'Description' if @options[:description]
    head
  end

  def get_rows
    rows = default_rows
    return rows if @options.empty?
    new_rows = options_rows
    (0...rows.count).map { |i| (rows[i] << new_rows[i]).flatten }
  end

  def options_rows
    date = option_response :created_at if @options[:date]
    description = option_response :description if @options[:description]
    return ([date] + [description]).compact.first if @options.count == 1
    [date, description].transpose
  end

  def option_response option
    @response.map { |r| "#{ r[option] }" }
  end

  def icon_state state
    return '❏' if state == 'todo'
    '✔'
  end
end
