DELETE FROM actionlogrecord WHERE starttime < current_timestamp - interval '90 days';

