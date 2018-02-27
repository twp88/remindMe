class CollateTribeNumbersService
  def initialize(reminder)
    @reminder = reminder
  end

  def call
    if part_of_tribe?
      collate_tribe_numbers
    else
      collate_single_number
    end
  end

  private

  def part_of_tribe?
    @reminder.tribe_id
  end

  def collate_tribe_numbers
    tribe = Tribe.find(@reminder.tribe_id)
    tribe.tribe_members.map { |tm| User.find(tm.user_id).phone_number }
  end

  def collate_single_number
    [ User.find(@reminder.user_id).phone_number ]
  end
end
