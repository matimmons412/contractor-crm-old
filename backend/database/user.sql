-- ********************************************************************************
-- This script creates the database users and grants them the necessary permissions
-- ********************************************************************************

CREATE USER contractor_crm_owner
WITH PASSWORD 'crmowner';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO contractor_crm_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO contractor_crm_owner;

CREATE USER contractor_crm_appuser
WITH PASSWORD 'crmappuser';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO contractor_crm_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO contractor_crm_appuser;
