	.include "macro.inc"

	.syntax unified

	thumb_func_start GetFaceIdByXPos
GetFaceIdByXPos: @ 0x08008F38
	push {r4, lr}
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _08008F54 @ =0x030041C0
_08008F40:
	ldr r0, [r2]
	cmp r0, #0
	beq _08008F58
	movs r4, #0x34
	ldrsh r0, [r0, r4]
	cmp r0, r3
	bne _08008F58
	adds r0, r1, #0
	b _08008F64
	.align 2, 0
_08008F54: .4byte 0x030041C0
_08008F58:
	adds r2, #4
	adds r1, #1
	cmp r1, #3
	ble _08008F40
	movs r0, #1
	rsbs r0, r0, #0
_08008F64:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
