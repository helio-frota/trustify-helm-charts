{{/*
PSQL configuration env-vars.

Arguments (dict):

  * root - .
  * create-database - create-database object
  * prefix - (optional) prefix to the env-var names
*/}}
{{- define "trustification.psql.envVars" }}
- name: {{ .prefix | default "" }}PGHOST
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.host "msg" "Missing value for create-database host" ) | nindent 2 }}
- name: {{ .prefix | default "" }}PGPORT
  {{- include "trustification.common.envVarValue" (.database.port | default "5432") | nindent 2 }}
- name: {{ .prefix | default "" }}PGDATABASE
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.name "msg" "Missing value for create-database name" ) | nindent 2 }}
- name: {{ .prefix | default "" }}PGUSER
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.username "msg" "Missing value for create-database username" ) | nindent 2 }}
- name: {{ .prefix | default "" }}PGPASSWORD
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.password "msg" "Missing value for create-database password" ) | nindent 2 }}
- name: {{ .prefix | default "" }}PGSSLMODE
  value: {{ .database.sslMode | default "allow" }}
{{- end }}

{{/*
Postgres configuration env-vars.

Arguments (dict):

  * root - .
  * create-database - create-database object
  * prefix - (optional) prefix to the env-var names
*/}}
{{- define "trustification.postgres.envVars" }}
- name: {{ .prefix | default "TRUSTD_DB_" }}HOST
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.host "msg" "Missing value for create-database host" ) | nindent 2 }}
- name: {{ .prefix | default "TRUSTD_DB_" }}PORT
  {{- include "trustification.common.envVarValue" (.database.port | default "5432") | nindent 2 }}
- name: {{ .prefix | default "TRUSTD_DB_" }}NAME
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.name "msg" "Missing value for create-database name" ) | nindent 2 }}
- name: {{ .prefix | default "TRUSTD_DB_" }}USER
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.username "msg" "Missing value for create-database username" ) | nindent 2 }}
- name: {{ .prefix | default "TRUSTD_DB_" }}PASSWORD
  {{- include "trustification.common.requiredEnvVarValue" (dict "value" .database.password "msg" "Missing value for create-database password" ) | nindent 2 }}
- name: {{ .prefix | default "TRUSTD_DB_" }}SSLMODE
  value: {{ .database.sslMode | default "allow" }}
{{- end }}
