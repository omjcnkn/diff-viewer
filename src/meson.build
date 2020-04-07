diffviewer_sources = [
  'main.vala',
]

diffviewer_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
  dependency('libgit2-glib-1.0', version: ['>= 0.27.8']),
]

executable('diffviewer', diffviewer_sources,
  vala_args: '--target-glib=2.50',  dependencies: diffviewer_deps,
  install: true,
)
