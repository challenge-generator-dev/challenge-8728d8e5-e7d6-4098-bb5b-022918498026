# Aprovisionamiento de Infraestructura con Terraform para el Servicio de Ordenes

El objetivo de este reto es aprovisionar la infraestructura AWS necesaria para el servicio de ordenes utilizando Terraform. El servicio de ordenes es un componente clave en nuestro sistema de procesamiento de pedidos, responsable de gestionar y mantener el estado de las órdenes de los clientes. El aprovisionamiento debe ser idempotente y versionado para asegurar la consistencia y trazabilidad de los cambios.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo para el servicio de ordenes |
| **Nivel** | senior-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Obtener el proyecto base funcional enviando el Código Base a un asistente de IA, que lo analizará, corregirá errores y entregará cada archivo con su ruta.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Asegúrate de tener instalado para ejecutar el proyecto: JDK 17+, Maven 3.9+, IDE con soporte Java.
- Copia todo el contenido del campo **Código Base** de este reto — incluyendo el texto de instrucciones que aparece al inicio.
- Abre un asistente de IA (Claude en claude.ai, ChatGPT o Gemini — se recomienda Claude), pega el contenido copiado en el chat y envíalo.
- El asistente analizará los archivos, corregirá errores y entregará cada archivo con su ruta. Guárdalos en la carpeta donde quieras trabajar, respetando las rutas.
- Ejecuta `mvn compile` en la raíz. Si no hay errores, estás listo.

**Entregable:** El proyecto compila/arranca sin errores.

<details>
<summary>Pistas de conocimiento</summary>

- Copia el Código Base completo incluyendo el texto de instrucciones al inicio — esas instrucciones le indican al asistente exactamente qué hacer con los archivos.
- Si el asistente no entrega todos los archivos al terminar el análisis, escríbele: "entrégame todos los archivos con su ruta".
- Si el proyecto tiene errores al arrancar, comparte el mensaje de error con el mismo asistente para que lo corrija.

</details>

### Fase 1: Configuración Inicial

**Objetivo:** Configurar el entorno de Terraform y definir los recursos básicos de AWS necesarios para el servicio de ordenes.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Identificar los recursos de AWS necesarios para el servicio de ordenes (ej. VPC, subredes, grupos de seguridad, instancias EC2).
- Definir los archivos de configuración de Terraform para aprovisionar estos recursos.
- Establecer variables de entorno y archivos de estado para asegurar la idempotencia y versionado.

**Entregable:** Configuración de Terraform que define los recursos básicos de AWS para el servicio de ordenes.

<details>
<summary>Pistas de conocimiento</summary>

- Terraform permite definir la infraestructura como código.
- La idempotencia asegura que la aplicación repetida de la configuración no cambie el estado final.

</details>

### Fase 2: Aprovisionamiento y Validación

**Objetivo:** Aprovisionar la infraestructura definida en la fase anterior y validar que los recursos se han creado correctamente.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Ejecutar los comandos de Terraform para aprovisionar la infraestructura.
- Verificar que los recursos de AWS se han creado según lo definido en los archivos de configuración.
- Realizar pruebas de integración para asegurar que el servicio de ordenes funciona correctamente con la infraestructura aprovisionada.

**Entregable:** Infraestructura de AWS aprovisionada y validada para el servicio de ordenes.

<details>
<summary>Pistas de conocimiento</summary>

- Los comandos de Terraform `plan` y `apply` son usados para aprovisionar la infraestructura.
- Las pruebas de integración aseguran que el servicio funciona correctamente con la infraestructura.

</details>

### Fase 3: Versionado y Documentación

**Objetivo:** Versionar la configuración de Terraform y documentar el proceso de aprovisionamiento.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Versionar los archivos de configuración de Terraform en un repositorio de código.
- Documentar el proceso de aprovisionamiento, incluyendo los comandos ejecutados y los resultados obtenidos.
- Proponer mejoras para el proceso de aprovisionamiento basado en la experiencia adquirida.

**Entregable:** Configuración de Terraform versionada y documentación del proceso de aprovisionamiento.

<details>
<summary>Pistas de conocimiento</summary>

- El versionado de la configuración asegura la trazabilidad y reutilización de los cambios.
- La documentación clara facilita la comprensión y mantenimiento del proceso de aprovisionamiento.
- Java: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y cómo se utiliza para aprovisionar infraestructura?
- **paraQueSirve**: ¿Para qué sirve versionar la configuración de Terraform?
- **comoSeUsa**: ¿Cómo se utilizan los comandos de Terraform `plan` y `apply` para aprovisionar la infraestructura?
- **erroresComunes**: ¿Cuáles son los errores comunes que pueden surgir durante el aprovisionamiento y cómo se resuelven?
- **queDecisionesImplica**: ¿Qué decisiones implica el proceso de aprovisionamiento y cómo se documentan?

## Criterios de Evaluacion

- Configuración inicial de Terraform para el servicio de ordenes.
- Aprovisionamiento y validación de la infraestructura de AWS.
- Versionado y documentación del proceso de aprovisionamiento.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Mapa de componentes

El repo tiene una carpeta por componente. Cada uno se instala y verifica dentro de la suya.

| Componente | Carpeta | Rol | Capa | Track | Tecnologias |
|---|---|---|---|---|---|
| `infra` | `infra/` | practice | infra | Terraform (AWS) | Terraform |
| `api` | `api/` | chapter, support | server | Java | - |

## Orden de arranque

1. `cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate` — componente `infra` (practice).
2. `cd api && mvn clean compile` — componente `api` (chapter, support).

### Contratos entre componentes

- `api` expone http (api: http://localhost:8080):
  - `POST /api/orders`
  - `GET /api/orders/{id}`
  - `PUT /api/orders/{id}`
  - `DELETE /api/orders/{id}`

## Herramientas

- **Terraform**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).
- **Java**: Herramienta de trabajo del candidato: usala en la fase donde se depura o se prueba la solucion (no es una dependencia del proyecto).

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
(cd infra && terraform fmt -check -recursive && terraform init -backend=false && terraform validate) && (cd api && mvn clean compile)
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
