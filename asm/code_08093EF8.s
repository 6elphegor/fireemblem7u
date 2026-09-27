	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093EF8
sub_08093EF8: @ 0x08093EF8
	push {r4, r5, lr}
	adds r4, r0, #0
	bl PrepGetLatestUnitIndex
	movs r1, #0
	strh r0, [r4, #0x2c]
	strh r0, [r4, #0x2e]
	adds r4, #0x29
	strb r1, [r4]
	movs r5, #1
_08093F0C:
	adds r0, r5, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08093F2E
	ldr r0, [r1]
	cmp r0, #0
	beq _08093F2E
	ldr r0, [r1, #0xc]
	ldr r1, _08093F3C @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08093F2E
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_08093F2E:
	adds r5, #1
	cmp r5, #0x3f
	ble _08093F0C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08093F3C: .4byte 0x0001000C
