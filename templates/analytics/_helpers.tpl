{{/*
API-Analytics ImageTag
*/}}
{{- define "analyticsImageTag" -}}
{{- if .Values.analytics.imageTag }}{{ .Values.analytics.imageTag }}{{- else }}{{ required "Either analytics.imageTag or global.imageTag is required. Please configure your values.yaml accordingly." .Values.global.imageTag }}{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "analytics.labels" -}}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/version: {{ .Values.global.imageTag | quote }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
{{ include "analytics.selectorLabels" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "analytics.selectorLabels" -}}
app.kubernetes.io/component: "analytics"
app.kubernetes.io/name: {{ include "analytics.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- range $key, $value := .Values.analytics.labels }}
{{ $key }}: {{ $value | quote }}
{{- end }}
{{- end }}

{{/*
API-Analytics ImagePullPolicy
*/}}
{{- define "imagePullPolicy" -}}
{{- if .Values.analytics.imagePullPolicy }}{{ .Values.analytics.imagePullPolicy }}{{- else }}{{ .Values.global.imagePullPolicy }}{{- end }}
{{- end }}
