	.include "macro.inc"

	.syntax unified

	thumb_func_start SetAllUnitNotBackSprite
SetAllUnitNotBackSprite: @ 0x080183F4
	push {r4, r5, lr}
	movs r2, #1
	ldr r5, _08018424 @ =0x08B92EB0
	movs r4, #0xff
	ldr r3, _08018428 @ =0xFFFFFEFF
_080183FE:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018418
	ldr r0, [r1]
	cmp r0, #0
	beq _08018418
	ldr r0, [r1, #0xc]
	ands r0, r3
	str r0, [r1, #0xc]
_08018418:
	adds r2, #1
	cmp r2, #0xbf
	ble _080183FE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018424: .4byte 0x08B92EB0
_08018428: .4byte 0xFFFFFEFF
