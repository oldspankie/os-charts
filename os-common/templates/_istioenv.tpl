{{- define "os.common.istio.env.gateway" -}}
apiVersion: networking.istio.io/v1beta1
kind: Gateway
metadata:
  name: gateway-{{ .Values.envName }}
  namespace: {{ .Values.envNamespace }}
spec:
  selector:
    istio: ingressgateway
  servers:
  - port:
      number: 80
      name: http-{{ .Values.envName }}
      protocol: HTTP
    hosts:
    - "*.{{ .Values.domainName }}"
{{- end}}

{{- define "os.common.istio.env.canaryjs.stable" -}}
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: vs-{{ .Values.envName }}-canaryjs
  namespace: {{ .Values.envNamespace }}
spec:
  hosts:
  - "canaryjs-{{ .Values.envSuffix }}.{{ .Values.domainName }}"
  gateways:
  - os-dev/gateway-dev
  http:
  - route:
    - destination:
        host: canaryjs-{{ .Values.envName }}-stable
        port:
          number: 3001
{{- end}}

{{- define "os.common.istio.env.canarycore.stable" -}}
apiVersion: networking.istio.io/v1alpha3
kind: VirtualService
metadata:
  name: vs-{{ .Values.envName }}-canarycore
  namespace: {{ .Values.envNamespace }}
spec:
  hosts:
  - "canarycore-{{ .Values.envSuffix }}.{{ .Values.domainName }}"
  gateways:
  - os-dev/gateway-dev
  http:
  - route:
    - destination:
        host: canarycore-{{ .Values.envName }}-stable
        port:
          number: 58081
{{- end}}