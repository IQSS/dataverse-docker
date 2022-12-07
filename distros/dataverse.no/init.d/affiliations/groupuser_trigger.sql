DROP TRIGGER IF EXISTS group_trigger on authenticateduser;
DROP FUNCTION IF EXISTS public.groupmonitor() CASCADE;

CREATE FUNCTION public.groupmonitor() RETURNS trigger
    LANGUAGE plpgsql
    AS $$

BEGIN insert into explicitgroup_authenticateduser
   select e.id, a.id from explicitgroup as e, authenticateduser as a


    where emailconfirmed is not null AND (  ( split_part(a.email,'@', 2) = e.displayname) or

             ( split_part(split_part(a.email,'@', 2) , '.',2 ) ||'.'|| split_part(split_part(a.email,'@', 2) , '.',3) = e.displayname)
  or

             ( split_part(split_part(a.email,'@', 2) , '.',3 ) ||'.'|| split_part(split_part(a.email,'@', 2) , '.',4) = e.displayname)
          )

    and NOT EXISTS (select 1 from explicitgroup_authenticateduser
     where a.id = containedauthenticatedusers_id and e.id = explicitgroup_id);
  RETURN NEW;
END;
$$;

CREATE TRIGGER group_trigger AFTER UPDATE OF emailconfirmed ON public.authenticateduser FOR EACH ROW EXECUTE PROCEDURE public.groupmonitor();


