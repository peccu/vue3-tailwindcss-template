import { fileURLToPath } from 'node:url'
import { mergeConfig, defineConfig, configDefaults } from 'vitest/config'
import viteConfig from './vite.config'

export default mergeConfig(
  viteConfig,
  defineConfig({
    test: {
      outputFile: {
        html: './vitest-result/index.html',
      },
      reporters: ['default', 'html'],
      environment: 'jsdom',
      coverage: {
        // https://vitest.dev/config/#coverage
        reporter: ['text', 'json', 'html'],
        reportsDirectory: './vitest-result/coverage',
      },
      exclude: [...configDefaults.exclude, 'e2e/*', 'vue-app/**'],
      root: fileURLToPath(new URL('./', import.meta.url))
    }
  })
)
