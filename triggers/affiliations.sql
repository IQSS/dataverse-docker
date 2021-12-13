DROP TRIGGER IF EXISTS group_trigger on explicitgroup;

CREATE TRIGGER group_trigger AFTER INSERT ON explicitgroup

FOR EACH ROW EXECUTE PROCEDURE groupmonitor();

CREATE OR REPLACE FUNCTION groupmonitor() RETURNS TRIGGER AS $group_table$

BEGIN insert into explicitgroup_authenticateduser select e.id, a.id from explicitgroup as e, authenticateduser as a where e.displayname=a.affiliation and NOT EXISTS (select 1 from explicitgroup_authenticateduser where a.id = containedauthenticatedusers_id and e.id = explicitgroup_id);

RETURN NEW;

END;

$group_table$ LANGUAGE plpgsql;
