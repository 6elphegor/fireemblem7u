	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCameraAdjustedX
GetCameraAdjustedX: @ 0x08015894
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, _080158D4 @ =0x0202BBB8
	movs r1, #0xc
	ldrsh r2, [r0, r1]
	adds r1, r2, #0
	adds r1, #0x30
	adds r4, r0, #0
	cmp r1, r3
	ble _080158B2
	adds r2, r3, #0
	subs r2, #0x30
	cmp r2, #0
	bge _080158B2
	movs r2, #0
_080158B2:
	movs r1, #0xc
	ldrsh r0, [r4, r1]
	adds r0, #0xb0
	cmp r0, r3
	bge _080158CA
	movs r1, #0x28
	ldrsh r0, [r4, r1]
	adds r2, r3, #0
	subs r2, #0xb0
	cmp r2, r0
	ble _080158CA
	adds r2, r0, #0
_080158CA:
	lsls r0, r2, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080158D4: .4byte 0x0202BBB8
