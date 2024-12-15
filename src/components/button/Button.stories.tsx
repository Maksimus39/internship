import type { Meta, StoryObj } from "@storybook/react"

import { Button } from "./Button"

const meta = {
  component: Button,
  tags: ["autodocs"],
} satisfies Meta<typeof Button>

export default meta
type Story = StoryObj<typeof meta>

export const Primary: Story = {
  args: {
    variant: "primary",
    children: "primary",
  },
}

export const Secondary: Story = {
  args: {
    variant: "secondary",
    children: "secondary",
  },
}

export const LinkAsButton: Story = {
  args: {
    children: <a href="/sign-up">Sign Up</a>,
    asChild: true,
  },
}
