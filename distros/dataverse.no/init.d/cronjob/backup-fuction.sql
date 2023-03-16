drop function get_identifier;
create function get_identifier(thisid int)
returns text
language plpgsql
as
$$
declare
   authoritystring TEXT;
   v_sql text;
begin
	   v_sql = 'select identifier from dvobject where id in (select owner_id from dvobject where id=' || thisid || ' order by id desc) order by id desc';
	   execute v_sql into authoritystring;
	   return authoritystring;
end;
$$;

drop function get_ownership;
create function get_ownership(thisid int)
returns text
language plpgsql
as
$$
declare
   authoritystring TEXT;
   v_sql text;
begin
	   v_sql = 'select concat_ws(authority, identifier) from dvobject where id in (select owner_id from dvobject where id=' || thisid || ' order by id desc) order by id desc';
	   execute v_sql into authoritystring;
	   return authoritystring;
end;
$$;



drop function get_authority;
create function get_authority(thisid int)
returns text
language plpgsql
as
$$
declare
   authoritystring TEXT;
   v_sql text;
begin
	   v_sql = 'select authority from dvobject where id in (select owner_id from dvobject where id=' || thisid || ' order by id desc) order by id desc';
	   execute v_sql into authoritystring;
	   return authoritystring;
end;
$$;

