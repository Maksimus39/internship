import { ComponentPropsWithoutRef } from "react"

type Props = ComponentPropsWithoutRef<"button">

export const Button = ({ ...restProps }: Props) => {
  return <button {...restProps} />
}
