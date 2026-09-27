	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08057AD0
sub_08057AD0: @ 0x08057AD0
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08057AF4 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08057B02
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08057AF8
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	adds r1, #0x48
	b _08057B00
	.align 2, 0
_08057AF4: .4byte 0x0203E02C
_08057AF8:
	ldr r0, [r4, #0x60]
	ldr r1, [r4, #0x5c]
	ldrh r1, [r1, #2]
	subs r1, #0x48
_08057B00:
	strh r1, [r0, #2]
_08057B02:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _08057B26
	ldr r0, [r4, #0x60]
	bl AnimDelete
	ldr r1, _08057B2C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08057B26:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08057B2C: .4byte 0x0201774C
