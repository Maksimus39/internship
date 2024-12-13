import { ModalRadix } from "../modalRadix/ModalRadix.tsx"
import { Button } from "../button/Button.tsx"

type Props = {
  open: boolean
  onClose: () => void
}

export const DeletePostModal = ({ open, onClose }: Props) => {
  return (
    <ModalRadix open={open} onClose={onClose} modalTitle={"Delete Post"}>
      Are you sure you want to delete this post?
      <div>
        {/*Будем использовать обычные кнопки*/}
        {/*<button onClick={onClose}>Yes</button>*/}
        {/*<button onClick={onClose}>No</button>*/}

        <Button onClick={onClose}>Yes</Button>
        <Button onClick={onClose}>No</Button>
      </div>
    </ModalRadix>
  )
}
