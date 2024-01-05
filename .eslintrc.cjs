/* eslint-env node */
require('@rushstack/eslint-patch/modern-module-resolution')

module.exports = {
  root: true,
  'ignorePatterns': ['*.config.js', '!.storybook'],
  'extends': [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    '@vue/eslint-config-typescript',
    '@vue/eslint-config-prettier/skip-formatting',
    'plugin:storybook/recommended'
  ],
  parserOptions: {
    ecmaVersion: 'latest'
  }
}
