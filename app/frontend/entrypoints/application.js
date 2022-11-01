import { createApp, h } from 'vue'
import { createInertiaApp } from '@inertiajs/inertia-vue3'
import { InertiaProgress } from '@inertiajs/progress'
import * as bootstrap from 'bootstrap'
import '@/stylesheets/application.scss'

InertiaProgress.init()

const pages = import.meta.glob('@/Pages/**/*.vue')

createInertiaApp({
  resolve: name => pages[`/Pages/${name}.vue`](),
  setup({ el, App, props, plugin }) {
    createApp({ render: () => h(App, props) })
      .use(plugin)
      .mount(el)
  },
})
