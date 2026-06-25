# Proyecto de Pruebas Automatizadas - Demoblaze

Pruebas automatizadas de APIs REST para el sitio Demoblaze,
desarrolladas con KarateDSL y Maven.

---

## Tecnologías

| Herramienta | Versión |
|---|---|
| Java | 11 o superior |
| Apache Maven | 3.8 o superior |
| KarateDSL | 1.4.x |

---

## Requisitos previos

Verificar que están instalados:

```bash
java -version
mvn -version
```

---

## Estructura del proyecto

```
📁 DEMOBLAZE/
├── 📄 pom.xml
├── 📄 .gitignore
├── 📄 README.md
└── 📁 src/
    └── 📁 test/
        └── 📁 java/
            └── 📁 demoblaze/
                ├── 📄 DemoblazeTest.java      <- runner principal
                ├── 📄 karate-config.js        <- configuración global
                ├── 📄 logback-test.xml        <- configuración de logs
                ├── 📁 features/
                │   ├── 📄 Login.feature       <- escenarios de login
                │   └── 📄 Signup.feature      <- escenarios de registro
                └── 📁 helpers/
                    └── 📄 DataGenerator.java  <- generador de datos de prueba
```

---

## Cómo clonar y ejecutar

### 1. Clonar el repositorio

```bash
git clone https://github.com/ronaldhp17/DemoblazeRetoTecico.git
```

### 2. Instalar dependencias
Esto en el directorio donde está nuestro proyecto
```bash
mvn clean install -DskipTests
```

### 3. Ejecutar todas las pruebas

```bash
mvn test
```

### 4. Ejecutar una feature específica

```bash
# Solo pruebas de Login
mvn test "-Dkarate.options=classpath:demoblaze/features/Login.feature"
#si esa no funciona 
mvn test -Dkarate.options="classpath:demoblaze/features/Login.feature"

# Solo pruebas de Signup
mvn test "-Dkarate.options=classpath:demoblaze/features/Signup.feature"
#si esa no funciona 
mvn test -Dkarate.options="classpath:demoblaze/features/Signup.feature"

### 5. Ejecutar por tag

```bash
mvn test "-Dkarate.options=--tags @login"
#si esa no funciona
mvn test -Dkarate.options="--tags @login"

mvn test "-Dkarate.options=--tags @signup"
#si esa no funciona
mvn test -Dkarate.options="--tags @signup"

```

---

## Ver el reporte

Al finalizar la ejecución el reporte HTML queda en:

```
target/karate-reports/karate-summary.html

o lo puede ver en:
target/cucumber-html-reports/overview-features.html
```
Ese reporte de Cucumber no lo voy a excluir del gitIgnore para que pueda ver el reporte con una ejecución previa realizada por mi 
Abrirlo en el navegador para ver el detalle de cada escenario.

---

## Descripción de los componentes

| Archivo | Descripción |
|---|---|
| `DemoblazeTest.java` | Runner principal que ejecuta todos los features |
| `karate-config.js` | URL base y variables globales por ambiente |
| `logback-test.xml` | Configuración del nivel de logs en ejecución |
| `Login.feature` | Escenarios de prueba para el endpoint de login |
| `Signup.feature` | Escenarios de prueba para el endpoint de registro |
| `DataGenerator.java` | Clase auxiliar para generar datos dinámicos de prueba |

