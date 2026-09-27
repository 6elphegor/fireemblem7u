	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxSongOBJ2Main
EfxSongOBJ2Main: @ 0x08063284
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _080632A8
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xee
	movs r3, #1
	bl PlaySFX
_080632A8:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	ble _080632C8
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _080632D0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080632C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080632D0: .4byte 0x0201774C
