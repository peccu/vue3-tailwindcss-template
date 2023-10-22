import { test, expect } from '@playwright/test';

// See here how to get started:
// https://playwright.dev/docs/intro
test('visits the app root url', async ({ page }) => {
  await page.goto('/');
  await expect(page.locator('div.greetings > h1')).toHaveText('You did it! with number 0');
})

/*
 * for VRT
 * take base snapshots
 * $ bun run test:e2e:vrt-snapshots
 * and update local implementation and run VRT
 * $ bun run test:e2e:vrt
 */
// cf. https://blog.cybozu.io/entry/2022/03/18/100000
// await page.fill('.input', '3');
// expect(await page.screenshot()).toMatchSnapshot('vrt-top-page.png', { threshold: 0.075 });

test('vrt top page', async ({ page }) => {
  await page.goto('/');

  await expect(page).toHaveScreenshot();
})

test('vrt about page', async ({ page }) => {
  await page.goto('/about');

  await expect(page).toHaveScreenshot();
})
