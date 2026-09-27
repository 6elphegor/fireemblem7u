	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046F04
sub_08046F04: @ 0x08046F04
	push {r4, lr}
	adds r4, r0, #0
_08046F08:
	ldr r1, [r4, #0x5c]
	cmp r1, #4
	ble _08046F1A
	bl CloseHelpBox
	adds r0, r4, #0
	bl Proc_Break
	b _08046F72
_08046F1A:
	ldr r0, [r4, #0x58]
	lsls r0, r0, #6
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _08046F40 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _08046F38
	ldr r0, [r2]
	cmp r0, #0
	bne _08046F44
_08046F38:
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
	b _08046F08
	.align 2, 0
_08046F40: .4byte 0x00010004
_08046F44:
	ldr r3, _08046F78 @ =0x0203DC9C
	ldr r0, [r4, #0x58]
	lsls r0, r0, #3
	adds r1, r3, #0
	adds r1, #0x30
	adds r0, r0, r1
	movs r1, #0x1e
	str r1, [r0]
	ldr r1, [r4, #0x58]
	lsls r2, r1, #3
	adds r2, r2, r3
	lsls r1, r1, #6
	ldr r0, [r4, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	adds r2, #0x2c
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_08044AC0
	ldr r0, [r4, #0x5c]
	adds r0, #1
	str r0, [r4, #0x5c]
_08046F72:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046F78: .4byte 0x0203DC9C
