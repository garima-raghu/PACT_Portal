-- PACT Portal — Demo Seed Data (Anonymized)
-- All names, companies and values are fictional

USE CRTracker;
GO

-- Demo Customer
INSERT INTO customers (id, company_name, country, currency_code, created_at)
VALUES (NEWID(), 'GlobalChem GmbH', 'Germany', 'EUR', GETDATE());

-- Demo Users
INSERT INTO users (id, full_name, email, system_role, is_customer_user, is_active, initials)
VALUES
(NEWID(), 'Service Manager', 'sm@msp.com', 'ServiceManager', 0, 1, 'SM'),
(NEWID(), 'Agreement Manager', 'am@msp.com', 'AgreementManager', 0, 1, 'AM'),
(NEWID(), 'Service Analyst', 'sa@msp.com', 'ServiceAnalyst', 0, 1, 'SA'),
(NEWID(), 'Customer Approver 1', 'ca1@globalchem.com', 'CustomerApprover', 1, 1, 'CA'),
(NEWID(), 'Customer Approver 2', 'ca2@globalchem.com', 'CustomerApprover', 1, 1, 'C2'),
(NEWID(), 'Portal Admin', 'admin@msp.com', 'PortalAdmin', 0, 1, 'PA');
GO

-- Demo Change Requests
-- CR-001: Large recurring AMS CR
-- CR-002: Small T&M CR (completed)
-- CR-003: Medium T&M CR (implementing)
-- (Add your own CRs following the same pattern)
