# Blueprint Operativo: Métodos y Patrones de Dinamo Sites con IA

Documento maestro con la ingeniería inversa de los flujos de trabajo de Rodrigo Olivares (*Crea con IA* / *Dínamo Sites* / *Círculo Builders*) aplicados al agente `motion-web-architect`.

---

## 1. Los 4 Pilares Técnicos Identificados en los Videos

| Video / Referencia | Concepto Clave | Implementación en Código |
| :--- | :--- | :--- |
| **`lapkvCSxW0k`** | Generación de layouts y assets con Gemini Flash + Pinterest | Inyección de paletas de color contemporáneas, fuentes tipo editorial (Syne, Plus Jakarta Sans) y Bento Grids con bordes iluminados (`border-glow`). |
| **`i5cCiDREi2M`** | Scroll-driven storytelling inmersivo (recorrido 3D/video continuo) | Vinculación del progreso del scroll (`useScroll`) a la reproducción de frames o transformaciones de escala/opacidad en CSS (`useTransform`). |
| **`-8j4kYvZha0`** | Fondos cinemáticos dinámicos y microinteracciones de tarjetas | Fondos en bucle con overlays de contraste (`bg-black/60`), esferas de luz difusa (`blur-[140px]`) y tarjetas con gradiente al pasar el cursor. |
| **`BdFKIWHC6a8`** | Vibe Coding y estructuración modular por bloques | Desacoplamiento de componentes (`Hero`, `Features`, `Showcase`, `FAQ`, `CTA`) acompañados de prompts deterministas reproducibles. |

---

## 2. Anatomía de Componente Dinamo Sites en React + Framer Motion

```jsx
import React from 'react';
import { motion, useScroll, useTransform } from 'framer-motion';
import { Sparkles, ArrowRight } from 'lucide-react';

export const HeroCinematic = ({ videoSrc, title, subtitle, ctaText }) => {
  const { scrollY } = useScroll();
  const y = useTransform(scrollY, [0, 500], ['0%', '25%']);
  const opacity = useTransform(scrollY, [0, 400], [1, 0.2]);

  return (
    <section className="relative w-full min-h-screen flex items-center justify-center overflow-hidden bg-[#0a0a0a]">
      {/* Background Video con Capa de Contraste */}
      <motion.div style={{ y, opacity }} className="absolute inset-0 w-full h-full pointer-events-none">
        {videoSrc ? (
          <video
            autoPlay
            loop
            muted
            playsInline
            className="w-full h-full object-cover opacity-40 scale-105"
            src={videoSrc}
          />
        ) : (
          <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,rgba(16,185,129,0.15),transparent_70%)]" />
        )}
        <div className="absolute inset-0 bg-gradient-to-t from-[#0a0a0a] via-transparent to-[#0a0a0a]/80" />
      </motion.div>

      {/* Contenido Editorial Flotante */}
      <div className="relative z-10 max-w-5xl mx-auto px-6 text-center">
        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6 }}
          className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full border border-white/10 bg-white/5 backdrop-blur-md mb-8"
        >
          <Sparkles className="w-4 h-4 text-emerald-400" />
          <span className="text-xs uppercase tracking-widest text-zinc-300 font-medium">Experiencia Interactiva</span>
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.1 }}
          className="text-5xl sm:text-7xl font-bold tracking-tight text-white mb-6"
        >
          {title}
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.2 }}
          className="text-lg sm:text-xl text-zinc-400 max-w-2xl mx-auto mb-10 leading-relaxed"
        >
          {subtitle}
        </motion.p>

        <motion.div
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.3 }}
        >
          <button className="inline-flex items-center gap-3 px-8 py-4 rounded-xl bg-white text-black font-semibold text-sm hover:bg-zinc-200 transition-all duration-300 shadow-[0_0_30px_rgba(255,255,255,0.2)] hover:scale-[1.02]">
            {ctaText}
            <ArrowRight className="w-4 h-4" />
          </button>
        </motion.div>
      </div>
    </section>
  );
};
```
