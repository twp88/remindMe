
# Service that sends messages
class SendMessageService
  attr_reader :all_todos, :messages
  def initialize
    @todos = Todo.all
    @all_todos = []
    @messages = ''
  end

  def call
    create_keys
    prepare_messages(@todos)
    @subscribers.each do |number, _name|
      @client.account.messages.create(
        from: @from,
        to: number,
        body: @messages
      )
    end
    message_sent
  end

  private

  def create_keys
    @keys = Hash[*File.read('secrets.txt').split(/[, \n]+/)]
    @client = create_client
    @from = @keys['from']
    @subscribers = Hash[*File.read('subscribers.txt').split(/[, \n]+/)]
  end

  def create_client
    account_sid = @keys['account_sid']
    auth_token = @keys['auth_token']
    Twilio::REST::Client.new account_sid, auth_token
  end

  def prepare_messages(todos)
    @todays_todos = todos.map { |todo| todo if todo.date == Date.today }

    if @todays_todos.all?(&:nil?)
      @messages = 'Nothing to do today!'
    else
      @todays_todos.each do |todo|
        @messages << todo.activity << ' ' unless !todo.nil?
      end
    end
  end

  def message_sent
    'Message sent'
  end
end
