import { Meta, StoryObj } from "@storybook/react"
import { useState } from "react"

import { ModalRadix } from "./ModalRadix.tsx"
import { Button } from "../button/Button.tsx"

const meta = {
  component: ModalRadix,
  tags: ["autodocs"],
} satisfies Meta<typeof ModalRadix>

export default meta
type Story = StoryObj<typeof ModalRadix>

/** BaseModal */
export const BaseModal: Story = {
  args: {
    modalTitle: "Modal title",
    children: <div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, error.</div>,
  },
  render: function Render(args) {
    const [showModal, setShowModal] = useState(false)

    const openModalHandler = () => {
      setShowModal(true)
    }

    const closeModalHandler = () => {
      setShowModal(false)
    }

    return (
      <>
        <Button variant={"primary"} onClick={openModalHandler}>
          Open modal
        </Button>
        <ModalRadix {...args} open={showModal} onClose={closeModalHandler} />
      </>
    )
  },
}
