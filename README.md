# Prism Demo

A Rails + [ActiveAdmin](https://activeadmin.info) demo app, themed with the
[`active_admin_prism`](https://github.com/ramlaxmanyadav/active_admin_prism)
sidebar theme, seeded with a small "school" dataset (Subjects, Teachers,
Staff, Books, Students — 50 records each) so the admin has real data to
click through.

Database is SQLite, so there's nothing to install or configure to get a
working database — the file lives at `storage/development.sqlite3`.

## Requirements

- Ruby `3.2.2` (see `.ruby-version`)
- Node.js `>= 18` (see `.nvmrc` — if you use `nvm`, run `nvm use` in this
  directory; ActiveAdmin's JS is bundled with esbuild, which requires 18+)

## Setup

```sh
bundle install
npm install
bin/rails db:prepare   # creates storage/development.sqlite3 and migrates
bin/rails db:seed      # loads the demo admin user + 50 records per model
```

## Running it

```sh
bin/dev
```

This starts the Rails server on port 3000 **and** the two asset watchers
(Dart Sass for `active_admin.scss`, esbuild for ActiveAdmin's JS bundle), and
is the easiest way to get a working `/admin` — the watchers build both
bundles immediately on startup, then keep rebuilding if you edit
`app/admin/*.rb` styling or the JS entry point.

`app/assets/builds/` isn't checked into git (it's generated), so if you'd
rather just run the plain server without watchers, build both bundles once
first:

```sh
bin/rails dartsass:build
bin/rails active_admin_js:build
bin/rails server
```

(Don't use `bin/rails assets:precompile` for this — in development it also
writes a `public/assets` manifest that then overrides Propshaft's normal
live/dev asset serving until you delete it.)

Then open the admin in your browser:

**[https://prism-demo.onrender.com/admin](https://prism-demo.onrender.com/admin)**

(Running locally instead? Use [http://localhost:3000/admin](http://localhost:3000/admin) —
or just [http://localhost:3000](http://localhost:3000), since `/` now
redirects straight to `/admin`.)

### Demo login

| | |
| --- | --- |
| **Email**    | `admin@example.com` |
| **Password** | `password` |

## What's in the demo

- **Subjects, Teachers, Staff, Books, Students** — five related models under
  the "School" sidebar group, 50 seeded rows each (`db/seeds.rb`, via
  [Faker](https://github.com/faker-ruby/faker)). Re-run `bin/rails db:seed`
  any time to reset back to a clean 50-per-model dataset.
- The Prism theme's sidebar, colorized row-action icons, styled delete
  confirmation dialogs, and toggle-switch fields are all wired up — see
  [`active_admin_prism`'s INTEGRATION.md](https://github.com/ramlaxmanyadav/active_admin_prism/blob/main/INTEGRATION.md)
  for the full feature/config reference.

## Notes for hosting this elsewhere

This is a normal Rails server process (Puma) backed by SQLite — it needs
somewhere that can actually run Ruby and keep a process alive (e.g.
[Fly.io](https://fly.io), [Render](https://render.com),
[Railway](https://railway.app), or the bundled [Kamal](https://kamal-deploy.org)
config for your own server). **GitHub Pages only serves static files**, so it
can't host this app directly — there's no Rails process behind it to run
migrations, serve `/admin`, or query the database.

## Rebuilding assets manually

Only needed if you're not running `bin/dev`'s watchers and change
`app/admin/*.rb`-driven styles or `app/javascript/admin/active_admin.js`:

```sh
bin/rails dartsass:build      # app/assets/stylesheets/active_admin.scss -> app/assets/builds/active_admin.css
bin/rails active_admin_js:build  # app/javascript/admin/active_admin.js -> app/assets/builds/active_admin.js
```

Both also run automatically as part of `bin/rails assets:precompile`.
