-- apply changes
create table url (
  id                            integer generated by default as identity not null,
  name                          varchar(255),
  last_status_code              integer,
  last_check_date               timestamptz,
  created_at                    timestamptz not null,
  constraint uq_url_name unique (name),
  constraint pk_url primary key (id)
);

create table url_check (
  id                            integer generated by default as identity not null,
  status_code                   integer not null,
  title                         varchar(255),
  h1                            varchar(255),
  description                   text,
  url_id                        integer,
  created_at                    timestamptz not null,
  constraint pk_url_check primary key (id)
);

create index ix_url_check_url_id on url_check (url_id);
alter table url_check add constraint fk_url_check_url_id foreign key (url_id) references url (id) on delete restrict on update restrict;

