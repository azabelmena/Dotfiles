config.load_autoconfig()

c.tabs.background = False
c.new_instance_open_target = 'window'
c.downloads.position = 'bottom'
# c.spellcheck.languages = ['en-US', 'es-ES', 'pt-BR']

# Bindings for normal mode
config.bind('M', 'hint links spawn mpv {hint-url}')
config.bind('Z', 'hint links spawn st -e youtube-dl {hint-url}')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('xb', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')
config.bind('xx', 'config-cycle statusbar.show always never;; config-cycle tabs.show always never')
config.bind(',ce', 'config-edit')
config.bind(',p', 'config-cycle -p content.plugins ;; reload')

config.bind(',rta', 'open {url}top/?sort=top&t=all')
config.bind(',rtv', 'spawn termite -e "rtv {url}"')
config.bind(',c', 'spawn -d chromium {url}')

css = '~/proj/solarized-everything-css/css/gruvbox/gruvbox-all-sites.css'
config.bind(',n', f'config-cycle content.user_stylesheets {css} ""')

#config.set("colors.webpage.darkmode.enabled", True)

c.url.searchengines = {"DEFAULT": "https://www.duckduckgo.com/?q={}"}
c.url.default_page = "https://www.duckduckgo.com/"
c.url.start_pages = "https://azabelmena.github.io/"

# c.url.searchengines['rfc'] = 'https://tools.ietf.org/html/rfc{}'
# c.url.searchengines['pypi'] = 'https://pypi.org/project/{}/'
# c.url.searchengines['qtbug'] = 'https://bugreports.qt.io/browse/QTBUG-{}'
# c.url.searchengines['http'] = 'https://httpstatuses.com/{}'
# c.url.searchengines['duden'] = 'https://www.duden.de/suchen/dudenonline/{}'
# c.url.searchengines['dictcc'] = 'https://www.dict.cc/?s={}'
#c.url.searchengines['maps'] = 'https://www.google.com/maps?q=%s'

c.fonts.tabs.selected = 'BlexMono Nerd Font'
c.fonts.tabs.unselected = 'BlexMono Nerd Font'
c.fonts.hints = 'BlexMono Nerd Font'
c.fonts.statusbar = 'BlexMono Nerd Font'
c.fonts.web.family.fantasy = 'BlexMono Nerd Font'

c.search.incremental = False

#c.qt.args = ['ppapi-widevine-path=/usr/lib/qt/plugins/ppapi/libwidevinecdmadapter.so']

c.content.javascript.enabled = True
config.source('gruvbox.py')
