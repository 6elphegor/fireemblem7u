	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08084320
sub_08084320: @ 0x08084320
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl sub_080831B4
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _08084360
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, _08084368 @ =0x0203E70C
	adds r0, r0, r1
	movs r1, #0
	bl Text_SetCursor
	adds r0, r4, #0
	bl Proc_Break
_08084360:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08084368: .4byte 0x0203E70C
