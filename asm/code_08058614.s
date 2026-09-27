	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxFireOBJ_Loop
EfxFireOBJ_Loop: @ 0x08058614
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x25
	bne _0805863A
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r0, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r0, r3]
	movs r0, #0xf2
	movs r3, #1
	bl PlaySFX
	b _08058652
_0805863A:
	cmp r0, #0x32
	ble _08058652
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08058658 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08058652:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08058658: .4byte 0x0201774C
