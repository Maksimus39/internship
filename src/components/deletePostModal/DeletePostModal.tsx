import { ModalRadix } from "../modalRadix/ModalRadix.tsx"
import { Button } from "../button/Button.tsx"

type Props = {
  open: boolean
  onClose: () => void
}

export const DeletePostModal = ({ open, onClose }: Props) => {
  return (
    <ModalRadix open={open} onClose={onClose} modalTitle={"Delete Post"} size={"sm"}>
      Are you sure you want to delete this post?
      <div>
        <Button onClick={onClose}>Yes</Button>
        <Button onClick={onClose} variant={"secondary"}>
          No
        </Button>
      </div>
    </ModalRadix>
  )
}
