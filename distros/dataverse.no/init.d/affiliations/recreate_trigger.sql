DROP TRIGGER IF EXISTS affiliation_trigger ON public.authenticateduser;
DROP TRIGGER IF EXISTS affiliation_trigger ON public.actionlogrecord;
CREATE TRIGGER affiliation_trigger AFTER INSERT ON public.actionlogrecord FOR EACH ROW EXECUTE PROCEDURE public.affiliationupdate();
