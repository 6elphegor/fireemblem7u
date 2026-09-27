	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCameraCenteredX
GetCameraCenteredX: @ 0x0801591C
	adds r1, r0, #0
	subs r1, #0x78
	cmp r1, #0
	bge _08015926
	movs r1, #0
_08015926:
	ldr r0, _08015940 @ =0x0202BBB8
	movs r2, #0x28
	ldrsh r0, [r0, r2]
	cmp r1, r0
	ble _08015932
	adds r1, r0, #0
_08015932:
	movs r2, #0x10
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r1, r0
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0
_08015940: .4byte 0x0202BBB8
