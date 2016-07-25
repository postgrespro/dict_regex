EXTENSION = dict_regex
MODULE_big = dict_regex
OBJS =  dict_regex.o parser.o utils.o
DATA = dict_regex--1.0.sql
DOCS = README.dict_regex
REGRESS = dict_regex
SHLIB_LINK = -L/usr/local/lib -lpcre
PG_CPPFLAGS=-I/usr/local/include
EXTRA_CLEAN = sql/dict_regex.sql

ifdef USE_PGXS
PGXS := $(shell pg_config --pgxs)
include $(PGXS)
else
subdir = contrib/dict_regex
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif

