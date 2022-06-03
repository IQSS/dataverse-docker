
alter table authenticateduser drop constraint authenticateduser_email_key;
drop index index_authenticateduser_lower_email;
Update authenticateduser set email='noreply@uit.no';

update datasetfieldvalue set value='noreply@uit.no' where datasetfield_id in (select id from datasetfield where datasetfieldtype_id=15);
