	.include "macro.inc"

	.syntax unified

	thumb_func_start StoreAdjustedCameraPositions
StoreAdjustedCameraPositions: @ 0x08015C04
	push {r4, r5, lr}
	adds r4, r2, #0
	subs r0, #7
	str r0, [r4]
	subs r1, #5
	str r1, [r3]
	ldr r0, [r4]
	cmp r0, #0
	bge _08015C1A
	movs r0, #0
	str r0, [r4]
_08015C1A:
	ldr r0, [r3]
	cmp r0, #0
	bge _08015C24
	movs r0, #0
	str r0, [r3]
_08015C24:
	ldr r1, [r4]
	adds r1, #8
	ldr r5, _08015C54 @ =0x0202E3D8
	movs r0, #0
	ldrsh r2, [r5, r0]
	subs r0, r2, #1
	cmp r1, r0
	ble _08015C38
	subs r0, #0xe
	str r0, [r4]
_08015C38:
	ldr r0, [r3]
	adds r0, #4
	movs r1, #2
	ldrsh r2, [r5, r1]
	subs r1, r2, #1
	cmp r0, r1
	ble _08015C4C
	adds r0, r2, #0
	subs r0, #0xa
	str r0, [r3]
_08015C4C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08015C54: .4byte 0x0202E3D8
