class NextRoundService
  def call
    ActiveRecord::Base.transaction do
      teams = Team.all.sort{|a,b| a.matches <=> b.matches}
      return false if teams.count < 2
      teams.pop if teams.count.odd?
      teams.shuffle!
      teams.each_slice(2) do |home, away|
        GenerateMatch.new.call(home, away)
      end
    end

    true
  end
end
