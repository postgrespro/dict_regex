-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION dict_regex" to load this file. \quit

CREATE OR REPLACE FUNCTION dregex_init(internal)
        RETURNS internal
        AS 'MODULE_PATHNAME'
        LANGUAGE C;

CREATE OR REPLACE FUNCTION dregex_lexize(internal, internal, internal, internal)
        RETURNS internal
        AS 'MODULE_PATHNAME'
        LANGUAGE C
        WITH (isstrict);

CREATE TEXT SEARCH TEMPLATE regex_template (
        LEXIZE = 'dregex_lexize',
	    INIT   = 'dregex_init'
);

COMMENT ON TEXT SEARCH TEMPLATE regex_template IS 'Dictionary for normalization based on regular expressions';

