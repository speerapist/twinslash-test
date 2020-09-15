every :day, at '11:50pm' do
	rake 'automatic_publication:archive_post'
end

every :day, at '0:00am' do
	rake 'automatic_publication:publish_post'
end