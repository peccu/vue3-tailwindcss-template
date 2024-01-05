import type { Meta, StoryObj } from '@storybook/vue3'

import SampleButton from './Button.vue'

// More on how to set up stories at: https://storybook.js.org/docs/writing-stories
const meta = {
  title: 'Example/SampleButton',
  component: SampleButton,
  // This component will have an automatically generated docsPage entry: https://storybook.js.org/docs/writing-docs/autodocs
  tags: ['autodocs'],
  argTypes: {
    size: { control: 'select', options: ['small', 'medium', 'large'] },
    backgroundColor: { control: 'color' },
    onClick: { action: 'clicked' }
  },
  args: { primary: false } // default value
} satisfies Meta<typeof SampleButton>

export default meta
type Story = StoryObj<typeof meta>
/*
 *👇 Render functions are a framework specific feature to allow you control on how the component renders.
 * See https://storybook.js.org/docs/api/csf
 * to learn how to use render functions.
 */
export const Primary: Story = {
  args: {
    primary: true,
    label: 'SampleButton'
  }
}

export const Secondary: Story = {
  args: {
    primary: false,
    label: 'SampleButton'
  }
}

export const Large: Story = {
  args: {
    label: 'SampleButton',
    size: 'large'
  }
}

export const Small: Story = {
  args: {
    label: 'SampleButton',
    size: 'small'
  }
}
