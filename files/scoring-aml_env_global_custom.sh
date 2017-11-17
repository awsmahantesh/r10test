#!/bin/ksh
# ===========================================================================
#
# Fair Isaac Germany GmbH
#
# aml_env_global_custom
#
# ===========================================================================
# activate script trace
if [ "$FS_SHELL_TRACE" == "Y" ];then set -x; else set +x; fi

# DBMS ('oracle', 'db2', or 'ms_sql')
export AML_DB_TYPE=oracle

# Schema settings ('oracle': name of global and client user)
export AML_DB_GLOBAL_SCHEMA=$AML_DB_GLOBAL_SCHEMA

# Only Windows: ODBC DSN name ('oracle': same value as AML_DB_NAME required)
# Only UNIX: (Oracle: Oracle SID/TNS Name)/(DB2: DB2 Catalog Name)
export AML_DB_INSTANCE=$AML_DB_NAME

# Login user and password ('oracle': same as AML_DB_GLOBAL_SCHEMA,
# password used for all users)
export AML_DB_LOGIN_USER=$AML_DB_USER
# export AML_DB_LOGIN_PASSWD=$AML_DB_PASSWORD
export AML_DB_LOGIN_PASSWD_ENCRYPTED=$AML_DB_PASSWORD
export AML_DB_ENCRYPTED_PASSWD_YN=$AML_DB_PASSWORD_ENCRYPTED_YN

# Database hostname ('oracle', 'db2': only required for JDBC access)
export AML_DB_HOST=localhost,1526

# Database name ('oracle': SID/TNS-name, 'ms_sql'/'db2': database alias)
export AML_DB_NAME=$AML_DB_NAME

# Create database (error, if it does exist already)
export AML_DB_CREATE_DATABASE_YN=N

# Skip any database operation during installation
export AML_SKIP_ALL_DB_INSTALL_YN=N

# Database tablespaces/filegroup (tables and indices)
export AML_DB_TABSPACE=$AML_DB_TABSPACE
export AML_DB_IDXSPACE=$AML_DB_IDXSPACE

# Type settings, can be 'bank' or 'insurance'
export AML_TYPE=bank

# Language setting (in ISO-norm)
# If "AML_LANGUAGE_GLOBAL=de" is set, then "AML_LANGUAGE_CLIENT=de" must be set.
export AML_LANGUAGE_GLOBAL=de
export AML_LANGUAGE_CLIENT=de

# WLL loader configuration
# export AML_JDBC_CP=C:\Java\JDBC\ojdbc14.jar
export AML_WLL_JAVAOPT=-Xms128m -Xmx2048m

# Codepage used for reading input data files. (Default=UTF-8, use LOCALE for your system codepage)
export AML_CODEPAGE_INPUT_FILES=LOCALE

# Codepage used by siron compiler, replaces system codepage. Only 8-bit codepages allowed.
# If using the non-unicode database ddl-scripts, its important to export the correct codepage
# Use 'LOCALE' for the default os language or a specific codepage like 'windows-1252'
# export SIRON_CODEPAGE=LOCALE

# ---------------------------------------------------------------------------
# SironFD and CEP settings
# ---------------------------------------------------------------------------
# Turn on/off SironFD, if SironFD is to be installed
export FD_YN=N

# Directory containing true type fonts
export AML_FONTS_DIR=/usr/share/fonts

# Extra licenses
export AML_PROFILING_YN=Y
export AML_CASE_MGT_YN=Y

# ---------------------------------------------------------------------------
# Database (connection) settings
# ---------------------------------------------------------------------------
# activate unicode ddl
export AML_UNICODE_DB_YN=Y

# ---------------------------------------------------------------------------
# FS-Bus settings
# ---------------------------------------------------------------------------

# ODBC DNS name or instance to FS-Bus database
export FS_BUS_DB_INSTANCE=$AML_DB_INSTANCE

# Login user and password to FS-Bus database
export FS_BUS_DB_LOGIN_USER=$AML_DB_LOGIN_USER
export FS_BUS_DB_LOGIN_PASSWD=$AML_DB_LOGIN_PASSWD
export FS_BUS_DB_LOGIN_PASSWD_ENCRYPTED=$AML_DB_LOGIN_PASSWD_ENCRYPTED
export FS_BUS_DB_ENCRYPTED_PASSWD_YN=$AML_DB_ENCRYPTED_PASSWD_YN


# ---------------------------------------------------------------------------
# User exit activation
# ---------------------------------------------------------------------------
# User exit at begin of scoring
export AML_EXIT_BEG_YN=Y
# User exit at end of scoring (before log archiving)
export AML_EXIT_END_YN=N
# User exit after log archiving
export AML_EXIT_LOG_YN=N


# ---------------------------------------------------------------------------
# FICO Analytics settings
# ---------------------------------------------------------------------------
export AML_ANALYTICS_SERVER_URL=https://ficodmp.tonbeller.com:8443/streamEngine/rest
export AML_ANALYTICS_MODEL_FILE=aml-model.jar
# Directory of AML model file
# export configuration to %AML_CUSTOM_SCORING_LIB% if an indivual model file aml-model.jar is supplied
export AML_ANALYTICS_MODEL_DIR=$AML_SYSTEM_SCORING_LIB
export AML_ANALYTICS_DATA_FILE=in_all_analytics_WINDOWS.txt
export AML_ANALYTICS_PROFILE_NAME=AMLProfile
export AML_ANALYTICS_MODEL_NAME=AMLModel
# Maximal time of analytics scoring util abort (seconds)
export AML_ANALYTICS_MAX_SCORE_TIME=600
# Every n seconds the result status of the scoring job is checked. n is defined in AML_ANALYTICS_CHECK_CYCLE_TIME
export AML_ANALYTICS_CHECK_CYCLE_TIME=30
export AML_ANALYTICS_NUMBER_OF_THREADS=4
# Possible LOG Level Values SEVERE, ALL
export AML_ANALYTICS_LOG_LEVEL=SEVERE
# Max errors in Analytics-File (percent)
export AML_ANALYTICS_SCORE1_MAXERR_PER=5
export AML_ANALYTICS_SCORE2_MAXERR_PER=5
# Analytics JAVA Options for rest client
export AML_ANALYTICS_JAVA_OPS=-Xms64m -Xmx1536m
# Codepage analytics work files
export AML_ANALYTICS_CODEPAGE_WORK_FILES=LOCALE
# Rest Service Basic Authentication User
export AML_ANALYTICS_USERNAME=ANA01
#  Rest Service Basic Authentication Password
export AML_ANALYTICS_PASSWORD=siron
# Fill with your Consortium ID or leave the default value CONSORTIUMIDNULL)
export AML_ANALYTICS_CLIENTIDFROMHEADER=CONSORTIUMIDNULL
# Activate if sealed consortium files should be generated (export to Y)
export AML_ANALYTICS_CONSORTIUM_YN=N
# Use GZIP before uploading analytic data file
export AML_ANALYTICS_GZIP_YN=Y

# # Rest Service Basic Authentication User
# export AML_ANALYTICS_USERNAME=ANA01
# # Rest Service Basic Authentication Password
# export AML_ANALYTICS_PASSWORD=siron
# 
# export AML_ANALYTICS_SERVER_URL=https://ficodmp:8443/streamEngine/rest
# export AML_ANALYTICS_JAVA_OPS=-Xms64m -Xmx1536m -Djavax.net.ssl.trustStore=C:/Projekte/FICO-Analytics/Authentication/cacerts -Djavax.net.ssl.trustStorePassword=Siron123
# export AML_ANALYTICS_CLIENTIDFROMHEADER=ConsortiumID0001
# # export AML_ANALYTICS_MODEL_DIR=%AML_CUSTOM_SCORING_LIB%
# # export AML_ANALYTICS_MODEL_DIR=%AML_SYSTEM_SCORING_LIB%
# 
# export AML_ANALYTICS_SCORE1_MAXERR_PER=25
# export AML_ANALYTICS_SCORE2_MAXERR_PER=100
# export AML_ANALYTICS_PROFILE_NAME=AMLProfileWindows
# 
# # Activate if sealed consortium files should be generated (export to Y)
# export AML_ANALYTICS_CONSORTIUM_YN=N
# 
# # Altenative Windows Schreibweisen fuer den Path
# # ---OK---: export AML_ANALYTICS_JAVA_OPS=-Xms64m -Xmx1536m -Djavax.net.ssl.trustStore=C:/Projekte/SironAML/FICO-Analytics/Authentication/cacerts -Djavax.net.ssl.trustStorePassword=Siron123
# # ---OK---: export AML_ANALYTICS_JAVA_OPS=-Xms64m -Xmx1536m -Djavax.net.ssl.trustStore=C:\Projekte\SironAML\FICO-Analytics\Authentication\cacerts -Djavax.net.ssl.trustStorePassword=Siron123
# # ---OK---: export AML_ANALYTICS_JAVA_OPS=-Xms64m -Xmx1536m -Djavax.net.ssl.trustStore=C:\\Projekte\\SironAML\\FICO-Analytics\\Authentication\\cacerts -Djavax.net.ssl.trustStorePassword=Siron123
# 
# 
# export AML_ANALYTICS_JAVA_OPS=-Xms64m -Xmx1536m -Djavax.net.ssl.trustStorePassword=Siron123 -Djavax.net.ssl.trustStore=C:/Program Files/Java/jre1.8.0_111/lib/security/cacerts
# 
# C:/Program Files/Java/jre1.8.0_111/lib/security
