# Biblioteca de Prompts Maestros: Dínamo Sites — Cinematic Heroes v1

Colección curada de 8 prompts de producción extraídos del ecosistema Dínamo Sites (Rodrigo Olivares).
Clasificados por categoría visual y listos para ser reutilizados por el agente `motion-web-architect`.

---

## Índice de Escenas

| # | Nombre | Categoría | Tipografía Titular | Fondo | Interacción Principal |
|---|--------|-----------|-------------------|-------|----------------------|
| 1 | **Portal** | Cinematic Video Hero | Syne 700 | Video loop + overlay oscuro | "Ver escena" despeja texto / Escape restaura |
| 2 | **Tilo** | 3D Interactive Hero | Manrope 500 | Crema cálido `#fbf8ef` | Robot Three.js sigue cursor + parpadeo |
| 3 | **Corsa** | Cinematic Video Hero | Anton 400 | Video loop costera atardecer | "Ver escena" / Escape |
| 4 | **Nexo** | Character Video Hero | Space Grotesk 700 | Crema `#fbf8ef` + video contain | "Ver escena" / Escape |
| 5 | **Umbra** | Cinematic Video Hero | Barlow Condensed 600 | Video loop cañón violeta `#301b47` | "Ver escena" / Escape |
| 6 | **Celestia** | Elegant Service Hero | Instrument Serif 400 / Dancing Script | Video loop + capa negra 20% | Menú móvil glass + scroll hint |
| 7 | **Ratw** | Product/SaaS Hero | Inter 600 + Playfair Display italic | Video en contenedor redondeado 32px | Marco gris `#e5e7eb` 16px |
| 8 | **Anillos** | Tech/3D Hero | Inter 700 | Video fullscreen luminoso | Cifras animadas en base |

---

## Patrones Estructurales Universales (Extraídos de los 8 Prompts)

### A. Estructura de Prompt Determinista

Todo prompt Dínamo Sites sigue este esqueleto:

1. **Declaración de alcance** → "Crea una única sección hero cinematográfica llamada [Nombre]"
2. **Composición visual** → Disposición de elementos, colores, proporciones
3. **Tipografía y composición** → Familias, pesos, tamaños con `clamp()`, interlineado, tracking
4. **Movimiento** → Video (autoplay/muted/loop/playsInline) o Three.js interactivo
5. **Responsive** → Reglas de apilamiento, prefers-reduced-motion, foco visible
6. **Referencia y recursos** → URLs de demo, implementación, estilos y media
7. **Personalización opcional** → Marca, textos, destinos de enlaces

### B. Sistema Tipográfico

| Rol | Patrón | Ejemplos de Familias |
|-----|--------|---------------------|
| **Titular (Display)** | `clamp(MIN, VW, MAX)`, interlineado `.84-.95`, tracking `-.04em a -.07em` | Syne 700, Anton 400, Manrope 500, Space Grotesk 700, Barlow Condensed 600, Instrument Serif 400 |
| **Soporte (Body)** | `21-26px` escritorio, `20px` móvil | DM Sans 400/500, Inter 400/500 |
| **Botones** | Texto centrado, sin flechas, altura `60-66px`, bordes redondeados | Misma familia de soporte |
| **Marca / Navegación** | Cabecera sencilla, sin eyebrows ni líneas divisorias | Misma familia de titular |

### C. Sistema de Video Background

```
Reglas universales para <video> en heroes Dínamo Sites:
- autoPlay, muted, loop, playsInline (obligatorios)
- poster={imagenFallback} (obligatorio)
- object-fit: cover (fullscreen) | contain (character-focused)
- Overlay de contraste: bg-black/20 a bg-black/60 o gradiente radial
- Pausar fuera de pantalla (IntersectionObserver)
- Respetar prefers-reduced-motion (mostrar frame estático)
- Sin zoom, parallax ni movimiento artificial sobre el video
```

### D. Sistema de Interacción "Ver Escena"

```
Patrón compartido en heroes cinematográficos:
1. Botón CTA + enlace "Ver escena" visibles por defecto
2. Al hacer clic en "Ver escena" → texto se oculta con fade para apreciar el video
3. Aparece "Volver al inicio" como overlay discreto
4. Tecla Escape restaura el contenido original
5. Foco visible y control por teclado siempre activos
```

### E. Responsive Universal

```
Reglas compartidas en los 8 prompts:
- En móvil: conservar protagonista grande sin tapar el título
- Composiciones laterales: apilar texto y personaje verticalmente
- Permitir que la hero crezca en pantallas bajas (no fijar height rígido)
- prefers-reduced-motion: vista estática, pausar render/video
- Foco visible (:focus-visible) y control por teclado
- Menú plegable en móvil (cuando aplica)
```

---

## Prompt Completo #1: Portal (Cinematic Video Hero)

**Categoría:** Video fullscreen centrado con overlay oscuro
**Tipografía titular:** Syne 700, `clamp(62px, 6.9vw, 118px)`, interlineado `.89`, tracking `-.065em`
**Tipografía soporte:** DM Sans 400/500
**Fondo:** Video en loop de arco monumental de cerámica azul/cobre/nubes
**Botón:** Cristal azulado translúcido, blur 18px, borde blanco fino, reflejo interior
**Interacción:** "Ver escena" despeja texto / Escape restaura

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/cinematic-portal-be07fdbb3c13.mp4`
- Poster: `https://dinamosites.com/demos/cinematic-heroes-v1/media/portal.jpg`
- Demo: `https://dinamosites.com/demos/cinematic-heroes-v1/index.html?scene=portal`
- JS: `https://dinamosites.com/demos/cinematic-heroes-v1/source/centered.js`
- CSS: `https://dinamosites.com/demos/cinematic-heroes-v1/source/centered.css`

---

## Prompt Completo #2: Tilo (3D Interactive Hero con Three.js)

**Categoría:** Robot procedural Three.js con cursor tracking
**Tipografía titular:** Manrope 500, `clamp(76px, 8.2vw, 140px)`
**Tipografía soporte:** DM Sans 400/500
**Fondo:** Crema cálido, texto oscuro, acento cobre
**Layout:** Texto izquierda, robot grande derecha
**Interacción:** Cabeza y ojos siguen cursor, parpadeo y respiración, botón "Dile hola" activa saludo
**3D Engine:** Three.js 0.186.0, RoomEnvironment/PMREM, cámara 35°, DPR 1.75 (1.25 móvil)
**Canvas filter:** `saturate(1.28) contrast(1.045)`

**Assets:**
- Demo: `https://dinamosites.com/demos/cinematic-heroes-v1/index.html?scene=tilo`
- JS Scenes: `https://dinamosites.com/demos/cinematic-heroes-v1/source/scenes.js`
- JS Characters: `https://dinamosites.com/demos/cinematic-heroes-v1/source/characters.js`
- CSS: `https://dinamosites.com/demos/cinematic-heroes-v1/source/style.css`

---

## Prompt Completo #3: Corsa (Cinematic Video Hero)

**Categoría:** Video fullscreen centrado con composición de título arriba
**Tipografía titular:** Anton 400, `clamp(95px, 12vw, 210px)`, interlineado `.88`
**Tipografía soporte:** DM Sans 400/500
**Fondo:** Video automóvil rojo en carretera costera al atardecer
**Paleta:** Azul petróleo + marfil
**Layout:** Título arriba gran escala, subtítulo izquierda + botón derecha abajo

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/cinematic-corsa-1d34d7297f43.mp4`
- Poster: `https://dinamosites.com/demos/cinematic-heroes-v1/media/corsa.jpg`
- Demo: `https://dinamosites.com/demos/cinematic-heroes-v1/index.html?scene=corsa`

---

## Prompt Completo #4: Nexo (Character Video Hero)

**Categoría:** Video con object-fit:contain, personaje centrado sobre fondo claro
**Tipografía titular:** Space Grotesk 700, `clamp(42px, 5.4vw, 88px)`, interlineado `.9`, tracking `-.07em`
**Tipografía soporte:** DM Sans 400/500
**Fondo:** Crema `#fbf8ef`, video con silueta completa y bordes fundidos
**Layout:** Título oscuro arriba, video centrado, subtítulo + botón oscuro abajo

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/cinematic-nexo-bddc63806488.mp4`
- Poster: `https://dinamosites.com/demos/cinematic-heroes-v1/media/nexo.jpg`
- Demo: `https://dinamosites.com/demos/cinematic-heroes-v1/index.html?scene=nexo`

---

## Prompt Completo #5: Umbra (Cinematic Video Hero)

**Categoría:** Video fullscreen centrado con fondo oscuro violeta
**Tipografía titular:** Barlow Condensed 600, `clamp(95px, 12vw, 196px)`, interlineado `.84`, tracking `-.04em`
**Tipografía soporte:** DM Sans 400/500
**Fondo:** Cañón violeta `#301b47`, texto crema `#ffeecc`
**Layout:** Título bajo gran escala, gradiente oscuro inferior para legibilidad

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/cinematic-umbra-f2311aa6407f.mp4`
- Poster: `https://dinamosites.com/demos/cinematic-heroes-v1/media/umbra.jpg`
- Demo: `https://dinamosites.com/demos/cinematic-heroes-v1/index.html?scene=umbra`

---

## Prompt Completo #6: Celestia (Elegant Service Hero)

**Categoría:** Video fullscreen con navegación completa y estilo editorial/wellness
**Tipografía titular:** Instrument Serif 400 (segunda línea cursiva), `48px móvil / 72-96px tablet / 120px escritorio`
**Tipografía marca:** Dancing Script 400
**Tipografía UI:** Inter 300/400/500
**Fondo:** Video loop con capa negra 20%
**Botones:** "Reservar consulta" blanco sólido + "Descubrir el ritual" vidrio/glass
**Interacción:** Menú móvil negro translúcido, entrada fade+ascenso 12-24px en 0.8-1s

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/ritual-celeste-video-ab8ddd70b615.mp4`
- Poster: `https://media.dinamosites.com/library/v1/sections/ritual-celeste-poster-252a34000387.jpg`

---

## Prompt Completo #7: Ratw (Product/SaaS Hero)

**Categoría:** Video dentro de contenedor redondeado con marco exterior
**Tipografía titular:** Inter 600, `58px` (40px móvil), interlineado `1.06`
**Tipografía énfasis:** Playfair Display italic solo en palabra "importa"
**Fondo:** Marco gris `#e5e7eb` 16px, contenedor esquinas `32px`
**Layout:** Video cubre interior (no el marco), título+párrafo+botón centrados abajo
**Navegación:** Marca Ratw + enlaces + "Ver plantilla"

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/own-flowers-woman-v2-loop-99ac1e069f1e.mp4`

---

## Prompt Completo #8: Anillos (Tech/3D Hero)

**Categoría:** Video fullscreen tech/luminoso con métricas en base
**Tipografía titular:** Inter 700, `48-72px`, interlineado `1.02`
**Fondo:** Video fullscreen luminoso
**Layout:** Navegación + etiqueta + título + párrafo + 2 botones + cifras base (10K+ / 1M+)

**Assets:**
- Video: `https://media.dinamosites.com/library/v1/sections/own-rings-loop-c4553c15b2f1.mp4`
