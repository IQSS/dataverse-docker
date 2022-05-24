CREATE TABLE IF NOT EXISTS public.dvnoaffiliations (
    id bigint,
    dvno_affiliation character varying(255) DEFAULT NULL::character varying,
    dvno_group_name character varying(255) DEFAULT NULL::character varying,
    dvno_email_level integer DEFAULT 2
);

ALTER TABLE public.dvnoaffiliations OWNER TO dataverse;
--
-- Data for Name: dvnoaffiliations; Type: TABLE DATA; Schema: public; Owner: dataverse
--
COPY public.dvnoaffiliations (id, dvno_affiliation, dvno_group_name, dvno_email_level) FROM stdin;
139 UiT The Arctic University of Norway uit.no 2
27 Ostfold University College hiof.no 2
4 Akvaplan-niva akvaplan.niva.no 3
\.


CREATE OR REPLACE FUNCTION public.affiliationupdate() RETURNS trigger
     LANGUAGE plpgsql
     AS $$

BEGIN
    update authenticateduser set affiliation=dvno_affiliation from dvnoaffiliations where dvno_group_name=substring(email, '\S+\W(\w+\W+\w+)') and substring(email, '\S+\W(\w+\W+\w+)') in (select dvno_group_name from dvnoaffiliations);
    update authenticateduser set affiliation=dvno_affiliation from dvnoaffiliations where dvno_group_name=substring(email, '\S+\W(\w+\W+\w+\W+\w+)') and substring(email, '\S+\W(\w+\W+\w+\W+\w+)') in (select dvno_group_name from dvnoaffiliations);

RETURN NULL;
END;
$$
CREATE TRIGGER affiliation_trigger AFTER INSERT ON public.authenticateduser FOR EACH ROW EXECUTE PROCEDURE public.affiliationupdate();
