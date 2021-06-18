CREATE SEQUENCE dxo_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE dxo_user
(
    id integer NOT NULL DEFAULT nextval('dxo_user_id_seq'::regclass),
    external_user_id VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_user_pkey PRIMARY KEY (id)
);



CREATE SEQUENCE dxo_application_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


CREATE TABLE dxo_application
(
    id integer NOT NULL DEFAULT nextval('dxo_application_id_seq'::regclass),
    external_application_id VARCHAR(50) NULL DEFAULT NULL,
    application_name VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    client_id VARCHAR(50) COLLATE pg_catalog."default",
    CONSTRAINT dxo_application_pkey PRIMARY KEY (id)
);

INSERT INTO dxo_application (external_application_id, application_name, created_user, created_date, client_id) VALUES ('0oafh6948uvcpCLzc0h7', 'Fibi Portal', 'admin', '2018-03-23', '0oafh6948uvcpCLzc0h7');



CREATE SEQUENCE dxo_user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_user_preferences
(
    id integer NOT NULL DEFAULT nextval('dxo_user_preferences_id_seq'::regclass),
    application_id integer NOT NULL,
    user_id integer NOT NULL,
    preference_type VARCHAR(50) NULL DEFAULT NULL,
    preference_ind VARCHAR(50) NULL DEFAULT NULL,
    preference_value character varying(100) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_user_preferences_pkey PRIMARY KEY (id),
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES dxo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE SEQUENCE dxo_user_alerts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE dxo_user_alerts
(
    id integer NOT NULL DEFAULT nextval('dxo_user_alerts_id_seq'::regclass),
    application_id integer NOT NULL,
    user_id integer NOT NULL,
    alert_type VARCHAR(50) NULL DEFAULT NULL,
    alert_ind VARCHAR(50) NULL DEFAULT NULL,
    alert_value character varying(100) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_user_alerts_pkey PRIMARY KEY (id),
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES dxo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE SEQUENCE dxo_user_marketinfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_user_marketinfo
(
    id integer NOT NULL DEFAULT nextval('dxo_user_marketinfo_id_seq'::regclass),
    application_id integer NOT NULL,
    user_id integer NOT NULL,
    market_info VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_user_marketinfo_pkey PRIMARY KEY (id),
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES dxo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE SEQUENCE dxo_businessgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE dxo_businessgroup
(
    id integer NOT NULL DEFAULT nextval('dxo_businessgroup_id_seq'::regclass),
    external_business_id VARCHAR(50) NULL DEFAULT NULL,
    business_type VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_businessgroup_pkey PRIMARY KEY (id)
);

INSERT INTO dxo_businessgroup (external_business_id, business_type, created_user, created_date) VALUES ('S002', 'SAP', 'Admin', '2018-05-06');
INSERT INTO dxo_businessgroup (external_business_id, business_type, created_user, created_date) VALUES ('L001', 'Leap', 'Admin', '2018-05-06');


CREATE SEQUENCE dxo_user_businessgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE dxo_user_businessgroup
(
    id integer NOT NULL DEFAULT nextval('dxo_user_businessgroup_id_seq'::regclass),
    application_id integer NOT NULL,
    user_id integer NOT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    business_group_id integer NOT NULL,
    account_id VARCHAR(50) COLLATE pg_catalog."default",
    CONSTRAINT dxo_user_businessgroup_pkey PRIMARY KEY (id),
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT business_group_id FOREIGN KEY (business_group_id)
        REFERENCES dxo_businessgroup (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT user_id FOREIGN KEY (user_id)
        REFERENCES dxo_user (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE SEQUENCE dxo_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_role
(
    id integer NOT NULL DEFAULT nextval('dxo_role_id_seq'::regclass),
    role VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_role_pkey PRIMARY KEY (id)
);


CREATE SEQUENCE dxo_accessgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_accessgroup
(
    id integer NOT NULL DEFAULT nextval('dxo_accessgroup_id_seq'::regclass),
    okta_role VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    external_accessgroup_id VARCHAR(50) COLLATE pg_catalog."default",
    accessgroup_desc VARCHAR(50) COLLATE pg_catalog."default",
    CONSTRAINT dxo_accessgroup_pkey PRIMARY KEY (id)
);

INSERT INTO dxo_accessgroup (okta_role, created_user, created_date, external_accessgroup_id, accessgroup_desc) VALUES ('DXP_FIBI_Document_Read', 'Admin', '2018-03-23', '00gfh9o7umQPypVcV0h7','Cargill Administrator');
INSERT INTO dxo_accessgroup (okta_role, created_user, created_date, external_accessgroup_id, accessgroup_desc) VALUES ('DXP_FIBI_Document_Write', 'Admin', '2018-03-23',  '00gfh9rvtwFKDlZbL0h7', 'Buyer');


CREATE SEQUENCE dxo_application_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_application_role
(
    id integer NOT NULL DEFAULT nextval('dxo_application_role_id_seq'::regclass),
    application_id integer NOT NULL,
    role_id integer NOT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_application_role_pkey PRIMARY KEY (id),
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT role_id FOREIGN KEY (role_id)
        REFERENCES dxo_role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);



CREATE SEQUENCE dxo_application_role_accessgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_application_role_accessgroup
(
    id integer NOT NULL DEFAULT nextval('dxo_application_role_accessgroup_id_seq'::regclass),
    application_id integer NOT NULL,
    role_id integer NOT NULL,
    accessgroup_id integer NOT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_application_role_accessgroup_pkey PRIMARY KEY (id),
    CONSTRAINT accessgroup_id FOREIGN KEY (accessgroup_id)
        REFERENCES dxo_accessgroup (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT role_id FOREIGN KEY (role_id)
        REFERENCES dxo_role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);


CREATE SEQUENCE dxo_application_accessgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_application_accessgroup
(
    id integer NOT NULL DEFAULT nextval('dxo_application_accessgroup_id_seq'::regclass),
    application_id integer NOT NULL,
    accessgroup_id integer NOT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_application_accessgroup_pkey PRIMARY KEY (id),
    CONSTRAINT accessgroup_id FOREIGN KEY (accessgroup_id)
        REFERENCES dxo_accessgroup (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

INSERT INTO dxo_application_accessgroup (application_id, accessgroup_id, created_user, created_date) VALUES (1, 1, 'Admin', '2018-03-23');
INSERT INTO dxo_application_accessgroup (application_id, accessgroup_id, created_user, created_date) VALUES (1, 2, 'Admin', '2018-03-23');

CREATE SEQUENCE dxo_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_permission
(
    id integer NOT NULL DEFAULT nextval('dxo_permission_id_seq'::regclass),
    permission_type VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_permission_pkey PRIMARY KEY (id)
);


CREATE SEQUENCE dxo_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_resource
(
    id integer NOT NULL DEFAULT nextval('dxo_resource_id_seq'::regclass),
    resource_desc VARCHAR(50) NULL DEFAULT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_resource_pkey PRIMARY KEY (id)
);



CREATE SEQUENCE dxo_accessprivilege_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
	
CREATE TABLE dxo_accessprivilege
(
    id integer NOT NULL DEFAULT nextval('dxo_accessprivilege_id_seq'::regclass),
    accessgroup_id integer NOT NULL,
    permission_id integer NOT NULL,
    resource_id integer NOT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_accessprivilege_pkey PRIMARY KEY (id),
    CONSTRAINT accessgroup_id FOREIGN KEY (accessgroup_id)
        REFERENCES dxo_accessgroup (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT permission_id FOREIGN KEY (permission_id)
        REFERENCES dxo_permission (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT resource_id FOREIGN KEY (resource_id)
        REFERENCES dxo_resource (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);



CREATE SEQUENCE dxo_application_accessprivilege_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE dxo_application_accessprivilege
(
    id integer NOT NULL DEFAULT nextval('dxo_application_accessprivilege_id_seq'::regclass),
    application_id integer NOT NULL,
    accessprivilege_id integer NOT NULL,
    created_user VARCHAR(50) NULL DEFAULT NULL,
    created_date date,
    modified_user VARCHAR(50) NULL DEFAULT NULL,
    modified_date date,
    CONSTRAINT dxo_application_accessprivilege_pkey PRIMARY KEY (id),
    CONSTRAINT accessprivilege_id FOREIGN KEY (accessprivilege_id)
        REFERENCES dxo_accessprivilege (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT application_id FOREIGN KEY (application_id)
        REFERENCES dxo_application (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);
