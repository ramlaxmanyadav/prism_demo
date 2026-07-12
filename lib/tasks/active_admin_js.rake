namespace :active_admin_js do
  desc "Bundle ActiveAdmin's JS (jquery/jquery-ui/jquery-ujs/@activeadmin) for Propshaft"
  task build: :environment do
    system("npx", "esbuild", "app/javascript/admin/active_admin.js",
           "--bundle", "--format=iife",
           "--inject:app/javascript/admin/jquery_shim.js",
           "--outfile=app/assets/builds/active_admin.js",
           exception: true)
  end

  desc "Watch and rebuild ActiveAdmin's JS on file changes"
  task watch: :environment do
    system("npx", "esbuild", "app/javascript/admin/active_admin.js",
           "--bundle", "--format=iife",
           "--inject:app/javascript/admin/jquery_shim.js",
           "--outfile=app/assets/builds/active_admin.js",
           "--watch",
           exception: true)
  end
end

Rake::Task["assets:precompile"].enhance(["active_admin_js:build"])
