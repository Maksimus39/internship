import * as Dialog from "@radix-ui/react-dialog"
import { ReactNode } from "react"
import { Cross2Icon } from "@radix-ui/react-icons"
import s from "./ModalRadix.module.css"

type Props = {
  open: boolean
  onClose: () => void
  children: ReactNode
  modalTitle: string
}

export const ModalRadix = ({ modalTitle, onClose, children, open }: Props) => (
  <Dialog.Root open={open} onOpenChange={onClose}>
    <Dialog.Portal>
      <Dialog.Overlay className={s.Overlay} />
      <Dialog.Content className={s.Content}>
        <Dialog.Title className={s.Title}>{modalTitle}</Dialog.Title>
        <hr />
        {children}
        <Dialog.Close asChild>
          <button className={s.IconButton} aria-label="Close">
            <Cross2Icon />
          </button>
        </Dialog.Close>
      </Dialog.Content>
    </Dialog.Portal>
  </Dialog.Root>
)
