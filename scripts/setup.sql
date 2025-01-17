-- Quickstart:   Credit Card Fraud Detection using Snowflake ML
-- Version:      v1     
-- Author:       Jing Xie

USE ROLE sysadmin;


-- CREATE DATABASE CC_FINS_DB;
CREATE OR REPLACE DATABASE CC_FINS_DB;

USE DATABASE CC_FINS_DB;

--CREATE SCHEMA ANALYTICS;
CREATE OR REPLACE SCHEMA ANALYTICS;

CREATE OR REPLACE WAREHOUSE FD_WH WITH WAREHOUSE_SIZE='XSMALL';

CREATE OR REPLACE STAGE CC_FINS_DB.ANALYTICS.FRAUD_DETECTION_APP 
DIRECTORY = (ENABLE = TRUE) 
ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE');

-- Create Streamlir App
USE ROLE SYSADMIN;
CREATE OR REPLACE STREAMLIT CC_FINS_DB.ANALYTICS.FRAUD_DETECTION_APP
ROOT_LOCATION = '@CC_FINS_DB.ANALYTICS.FRAUD_DETECTION_APP'
MAIN_FILE = 'Fraud_Detection.py'
QUERY_WAREHOUSE = 'FD_WH';