CREATE OR REPLACE FUNCTION update_datasetversion_notify()
RETURNS trigger AS
$BODY$

DECLARE
data JSONB;
result JSONB;
BEGIN
SELECT json_agg(tmp)  -- requires Postgres9.3+
INTO data
FROM (
-- subquery:
-- SELECT dvo.id, dvo.identifier, dvo.protocol, dvo.authority, dvo.publicationdate, dsv.versionstate, dsv.versionnumber, dsv.minorversionnumber
-- FROM dvobject dvo, datasetversion dsv
-- WHERE dvo.id=dsv.dataset_id AND NEW.versionstate='RELEASED' AND dvo.id = NEW.dataset_id AND OLD.versionstate != NEW.versionstate
SELECT DISTINCT ON (dvo.id) dvo.id, dvo.identifier, dvo.protocol, dvo.authority, dvo.publicationdate, dsv.versionstate, dsv.versionnumber, dsv.minorversionnumber
FROM dvobject dvo, datasetversion dsv
WHERE dvo.id=dsv.dataset_id AND NEW.versionstate='RELEASED' AND dvo.id = NEW.dataset_id
ORDER BY dvo.id ASC, dsv.versionnumber DESC, dsv.minorversionnumber DESC
) tmp;
--result := json_build_object('data', data, 'row', row_to_json(NEW));
result := json_build_object('data', data);
PERFORM pg_notify('released_versionstate_datasetversion', result::TEXT);
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;
ALTER FUNCTION update_datasetversion_notify()
OWNER TO dataverse;

CREATE TRIGGER add_versionstate_task_event_trigger
AFTER UPDATE OF versionstate
ON datasetversion
FOR EACH ROW
EXECUTE PROCEDURE update_datasetversion_notify();
