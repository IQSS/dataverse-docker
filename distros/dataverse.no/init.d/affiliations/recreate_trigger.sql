DROP TRIGGER IF EXISTS affiliation_trigger ON public.authenticateduser;
CREATE TRIGGER affiliation_trigger AFTER INSERT ON public.authenticateduser FOR EACH ROW EXECUTE PROCEDURE public.affiliationupdate();
