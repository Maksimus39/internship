import s from "./Modal.module.css"
import { ReactNode } from "react"
import { createPortal } from "react-dom"

type Props = {
  open: boolean
  onClose?: () => void
  children?: ReactNode
  modalTitle: string
}

export const Modal = ({ onClose, open, children, modalTitle }: Props) => {
  return (
    <>
      {open && (
        <div>
          {createPortal(
            <div className={s.overlay}>
              <div className={s.content}>
                <h3 className={s.title}>{modalTitle}</h3>
                <hr />
                {children}
                <button className={s.closeIcon} onClick={onClose}>
                  X
                </button>
              </div>
            </div>,
            document.body,
          )}
        </div>
      )}
    </>
  )
}
