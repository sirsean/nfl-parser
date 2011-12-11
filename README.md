This gem supports downloading and parsing the JSON files provided by the NFL. Their API provides data for their mobile apps, and the JSON is available as files on Amazon S3.

To determine the current week, you need to look up "AllWeeks". Do that like so:

    all_weeks_downloader = NflParser::Download::AllWeeksDownloader.new
    all_weeks_parser = NflParser::Parse::AllWeeksParser.new
    all_weeks = all_weeks_parser.parse(all_weeks_downloader.download)

You can then determine the current week:

    all_weeks.current.season_type
    all_weeks.current.season
    all_weeks.current.week
    all_weeks.current.week_name

After determining the week you want, you'll want to get the schedule:

    schedule_downloader = NflParser::Download::ScheduleDownloader.new(:week => all_weeks.current)
    schedule_parser = NflParser::Parse::ScheduleParser.new
    schedule = schedule_parser.parse(schedule_downloader.download)

The schedule will let you jump to next/previous weeks, if you like:

    next_week_downloader = NflParser::Download::ScheduleDownloader.new(:week => schedule.week.next)
    next_week_schedule = schedule_parser.parse(next_week_downloader.download)

It also has all the games that are being played this week:

    game = schedule.games[0]
    puts "#{game.away_team.name} vs #{game.home_team.name}"

If you want to download an individual game, you can do that too:

    game_downloader = NflParser::Download::GameDownloader.new(game.game_id)
    game_parser = NflParser::Parse::GameParser.new
    my_game = game_parser.parse(game_downloader.download)
    puts "#{my_game.away_team.name} vs #{my_game.home_team.name}"
