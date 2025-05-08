# 🚀 Rails Dual Boot

## ¿Qué es Dual Boot?
- Permite ejecutar la misma aplicación con **dos versiones diferentes de Rails**.
- Útil para migraciones progresivas y detectar incompatibilidades.
- En nuestro caso: **Rails 6.0** (actual) y **Rails 6.1** (objetivo).

---

## ¿Por qué usamos Dual Boot?
- Detectamos deprecations **antes** de hacer un upgrade completo.
- Evitamos "big bang" upgrades y reducimos riesgo.
- Podemos hacer pruebas y benchmarks en paralelo.

---

## Gema: `next_rails` [Link](https://github.com/fastruby/next_rails)
- Gema que facilita dual boot en Rails.
- Permite definir la versión de Rails para cada comando.

### Ejemplo en nuestro proyecto:
```bash
bundle exec rspec
rails s

next bundle exec rspec
next rails s
```

## Docker Compose: Dual Boot Containers 🐳
- Usamos **2 contenedores web** para cada versión de Ruby/Gems:
  - `web` → Ruby 3.0 + Rails 6.0
  - `web-next` → Ruby 3.4 + Rails 6.1

  ### Volúmenes compartidos
```yaml
volumes:
  gems_3.0.3:
  gems_3.4.3:
  postgres_data:
```

- Así cada contenedor mantiene su propio set de gems.

### Comandos
``` bash
Actual
bin/run up # Server 6.0
bin/run rails c # Console 6.0

Next
bin/run next up # Server 6.1
bin/run next rails c # Console 6.1
```
