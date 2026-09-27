	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCameraCenteredY
GetCameraCenteredY: @ 0x08015944
	adds r1, r0, #0
	subs r1, #0x50
	cmp r1, #0
	bge _0801594E
	movs r1, #0
_0801594E:
	ldr r0, _08015968 @ =0x0202BBB8
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _0801595A
	adds r1, r0, #0
_0801595A:
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08015968: .4byte 0x0202BBB8
