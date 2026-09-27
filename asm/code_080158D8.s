	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCameraAdjustedY
GetCameraAdjustedY: @ 0x080158D8
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _08015918 @ =0x0202BBB8
	movs r1, #0xe
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x20
	adds r4, r0, #0
	cmp r1, r3
	ble _080158F6
	adds r2, r3, #0
	subs r2, #0x20
	cmp r2, #0
	bge _080158F6
	movs r2, #0
_080158F6:
	movs r1, #0xe
	ldrsh r0, [r4, r1]
	adds r0, #0x70
	cmp r0, r3
	bge _0801590E
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0x70
	cmp r2, r0
	ble _0801590E
	adds r2, r0, #0
_0801590E:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08015918: .4byte 0x0202BBB8
