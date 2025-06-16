USE DB_PTAC
CREATE USER usr_tbldesk FOR LOGIN usr_tbldesk;



USE DB_PTAC
GRANT SELECT ON SCHEMA::[SchDOC] TO [usr_tbldesk];
GRANT SELECT ON SCHEMA::[dbo] TO [usr_tbldesk];
GRANT SELECT ON SCHEMA::[SchPARAM] TO [usr_tbldesk];